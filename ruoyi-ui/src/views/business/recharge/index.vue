<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户名" prop="userId">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入用户名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['business:recharge:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['business:recharge:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['business:recharge:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:recharge:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="rechargeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用户名" align="center" prop="sysUser.userName"/>
      <el-table-column label="昵称" align="center" prop="sysUser.nickName"/>
      <el-table-column label="电话号码" align="center" prop="sysUser.phonenumber"/>
      <el-table-column label="邮箱" align="center" prop="sysUser.email"/>
      <el-table-column label="充值金额" align="center" prop="amount" />
      <el-table-column label="套餐名称" align="center" prop="setMeal.smName" />
      <el-table-column label="是否包月" align="center" prop="isSeries">
        <template slot-scope="scope">
          <span v-if="scope.row.isSeries==1">是</span>
          <span v-if="scope.row.isSeries==0">否</span>
        </template>
      </el-table-column>
      <el-table-column label="充值天数" align="center" prop="rechargeDay" />
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
            v-hasPermi="['business:recharge:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:recharge:remove']"
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

    <!-- 添加或修改充值管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="会员" class="item-magin">
          <div style="display:flex;flex-wrap: wrap;">
            <div style="width: 70%;">
              <el-select id="select" v-model="form.mId" placeholder="请选择会员" style="width: 100%;" @change="selectedMember">
                <el-option
                  v-for="item in memberList"
                  :key="item.mId"
                  :label="item.sysUser.userName"
                  :value="item.mId"
                  :disabled="item.status == 1"
                ></el-option>
              </el-select>
            </div>
            <div style="width: 30%;">
              <el-input v-model="form.userName" placeholder="请输入信息"
                        class="select"
                        @keyup.enter.native="selectMember"/>
            </div>
          </div>
        </el-form-item>
        <el-form-item label="充值金额" prop="amount">
          <el-input-number v-model="form.amount" placeholder="充值金额" disabled></el-input-number>
        </el-form-item>
        <el-form-item label="选择套餐" prop="stName" class="item-magin">
          <el-select v-model="item" placeholder="请选择下拉选择" clearable :style="{width: '100%'}" @change="selectSetMeal(item)">
            <el-option v-for="(item, index) in setMealList" :key="index" :label="item.smName"
                       :value="item" :disabled="item.disabled"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否包月" prop="isSeries" >
          <el-radio-group v-model="form.isSeries" size="medium">
            <el-radio v-for="(item, index) in isSeriesList" :key="index" :label="item.value"
                      :disabled="item.disabled">{{item.label}}</el-radio>
          </el-radio-group>
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
import { listRecharge, getRecharge, delRecharge, addRecharge, updateRecharge, exportRecharge } from "@/api/business/recharge";
import { listMember} from "@/api/business/member";

export default {
  name: "Recharge",
  data() {
    return {
      setMealList:[],
      memberList:[],
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
      // 充值管理表格数据
      rechargeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
      },
      isSeriesList: [{
        "label": "是",
        "value": 1
      }, {
        "label": "否",
        "value": 0
      }],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        isSeries: [
          { required: true, message: "是否包月不能为空", trigger: "blur" }
        ],
        delFlag: [
          { required: true, message: "删除标识符不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    selectedMember(){
      for(var i = 0;i < this.memberList.length;i++) {
        if(this.memberList[i].mId = this.form.mId){
          this.form.userId = this.memberList[i].userId
          break
        }
      }
    },
    selectSetMeal(item){
      this.form.rechargeDay = item.rechargeDay
      this.form.amount = item.currentPrices
      this.form.smId = item.smId
    },
    /** 查询充值管理列表 */
    /** 查询歌单列表 */
    selectMember(){
      listMember({userName:this.form.userName}).then(response => {
        this.memberList = response.rows
        document.getElementById("select").click()
      })
    },
    getList() {
      this.loading = true;
      listRecharge(this.queryParams).then(response => {
        this.rechargeList = response.rows;
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
        recId: null,
        userId: null,
        amount: null,
        smId: null,
        isSeries: null,
        rechargeDay: null,
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
      this.ids = selection.map(item => item.recId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加充值管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const recId = row.recId || this.ids
      getRecharge(recId).then(response => {
        this.form = response.data;
        this.item = this.form.setMeal.smName
        this.open = true;
        this.title = "修改充值管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.recId != null) {
            updateRecharge(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addRecharge(this.form).then(response => {
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
      const recIds = row.recId || this.ids;
      this.$confirm('是否确认删除充值管理编号为"' + recIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delRecharge(recIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有充值管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportRecharge(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    }
  }
};
</script>
