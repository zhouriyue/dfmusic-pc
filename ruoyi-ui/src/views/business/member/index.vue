<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户名" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入用户名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="createTime">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.createTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['business:member:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['business:member:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['business:member:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:member:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="memberList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用户名" align="center" prop="sysUser.userName"/>
      <el-table-column label="昵称" align="center" prop="sysUser.nickName"/>
      <el-table-column label="头像" width="80" align="center" prop="avatar">
        <template slot-scope="scope">
          <img :src="baseUrl+scope.row.sysUser.avatar" alt="" style="width:60px;height:60px;">
        </template>
      </el-table-column>
      <el-table-column label="等级" align="center" prop="mGrade" />
      <el-table-column label="到期时间" align="center" prop="validDay">
        <template slot-scope="scope">
          {{fun_date(scope.row.validDay,parseTime(scope.row.createTime, '{y}-{m}-{d}'))}}
        </template>
      </el-table-column>
      <el-table-column label="电话" align="center" prop="sysUser.phonenumber" />
      <el-table-column label="邮箱" align="center" prop="sysUser.email" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:member:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:member:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改会员信息管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="充值天数" prop="stName" class="item-magin">
          <el-select v-model="form.validDay" placeholder="请选择下拉选择" clearable :style="{width: '100%'}">
            <el-option v-for="(item, index) in setMealList" :key="index" :label="item.smName"
                       :value="item.rechargeDay" :disabled="item.disabled"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="用户" class="item-magin">
          <div style="display:flex;flex-wrap: wrap;">
            <div style="width: 70%;">
              <el-select id="select" v-model="form.userId" placeholder="请选择用户" style="width: 100%;">
                <el-option
                  v-for="item in userList"
                  :key="item.userId"
                  :label="item.userName"
                  :value="item.userId"
                  :disabled="item.status == 1"
                ></el-option>
              </el-select>
            </div>
            <div style="width: 30%;">
              <el-input v-model="form.userName" placeholder="请输入信息"
                        class="select"
                        @keyup.enter.native="selectUser"
                        v-on:input="selectUser"/>
            </div>
          </div>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import { listSet_meal} from "@/api/business/set_meal";
import { listMember, getMember, delMember, addMember, updateMember, exportMember } from "@/api/business/member";
import {selectUser} from "@/api/system/user";

export default {
  name: "Member",
  data() {
    return {
      setMealList:[],
      userList:[],
      baseUrl:'http://47.114.190.44',
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 会员信息管理表格数据
      memberList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        mGrade: null,
        userId: null,
        createTime: null,
        updateTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询歌单列表 */
    selectUser(){
      selectUser({userName:this.form.userName}).then(response => {
        this.userList = response.rows
        document.getElementById("select").click()
      })
    },
    /** 查询会员信息管理列表 */
    getList() {
      this.loading = true;
      listMember(this.queryParams).then(response => {
        this.memberList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
      listSet_meal().then(response => {
        this.setMealList = response.rows;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        mId: null,
        mGrade: null,
        userId: null,
        createTime: null,
        updateTime: null,
        delTime: null,
        delFlag: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.mId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加会员信息管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const mId = row.mId || this.ids
      getMember(mId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改会员信息管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.mId != null) {
            updateMember(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addMember(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              }
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const mIds = row.mId || this.ids;
      this.$confirm('是否确认删除会员信息管理编号为"' + mIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delMember(mIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有会员信息管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportMember(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    },
    fun_date(d,time) {
      var date1 = new Date(time),
        time1 = date1.getFullYear() + '-' + (date1.getMonth() + 1) + '-' + date1.getDate()//time1表示当前时间
      var date2 = new Date(date1)
      date2.setDate(date1.getDate() + d)
      var time2 = date2.getFullYear() + '-' + (date2.getMonth() + 1) + '-' + date2.getDate()
      return time2
    }
  }
};
</script>
<style>
  .item-magin {
    margin-right: 30px;
    height: 50px;
  }
</style>
