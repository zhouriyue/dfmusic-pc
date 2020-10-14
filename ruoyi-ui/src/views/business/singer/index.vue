<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="歌手编号" prop="sinId">
        <el-input
          v-model="queryParams.sinId"
          placeholder="请输入歌手编号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌手名" prop="sinName">
        <el-input
          v-model="queryParams.sinName"
          placeholder="请输入歌手名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌手昵称" prop="nickname">
        <el-input
          v-model="queryParams.nickname"
          placeholder="请输入歌手昵称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="性别" prop="sex">
        <el-select v-model="queryParams.sex" placeholder="请选择性别" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="年龄" prop="year">
        <el-input
          v-model="queryParams.year"
          placeholder="请输入年龄"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌手类型" prop="sinType">
        <el-select v-model="queryParams.sinType" placeholder="请选择歌手类型" clearable size="small">
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="关注数" prop="followerNumber">
        <el-input
          v-model="queryParams.followerNumber"
          placeholder="请输入关注数"
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
          v-hasPermi="['business:singer:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['business:singer:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['business:singer:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:singer:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="singerList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="歌手编号" align="center" prop="sinId" />
      <el-table-column label="歌手名" align="center" prop="sinName" />
      <el-table-column label="歌手昵称" align="center" prop="nickname" />
      <el-table-column label="性别" align="center" prop="sex" />
      <el-table-column label="年龄" align="center" prop="year" />
      <el-table-column label="歌手类型" align="center" prop="sinType" />
      <el-table-column label="住址" align="center" prop="area" />
      <el-table-column label="歌曲编号" align="center" prop="songNumber" />
      <el-table-column label="关注数" align="center" prop="followerNumber" />
      <el-table-column label="专辑数" align="center" prop="albumNumber" />
      <el-table-column label="mv数" align="center" prop="mvNumber" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:singer:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:singer:remove']"
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

    <!-- 添加或修改歌手信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="歌手名" prop="sinName">
          <el-input v-model="form.sinName" placeholder="请输入歌手名" />
        </el-form-item>
        <el-form-item label="歌手昵称" prop="nickname">
          <el-input v-model="form.nickname" placeholder="请输入歌手昵称" />
        </el-form-item>
        <el-form-item label="性别" prop="sex">
          <el-select v-model="form.sex" placeholder="请选择性别">
            <el-option label="请选择字典生成" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label="年龄" prop="year">
          <el-input v-model="form.year" placeholder="请输入年龄" />
        </el-form-item>
        <el-form-item label="歌手类型" prop="sinType">
          <el-select v-model="form.sinType" placeholder="请选择歌手类型">
            <el-option label="请选择字典生成" value="" />
          </el-select>
        </el-form-item>
        <el-form-item label="住址" prop="area">
          <el-input v-model="form.area" placeholder="请输入住址" />
        </el-form-item>
        <el-form-item label="歌曲编号" prop="songNumber">
          <el-input v-model="form.songNumber" placeholder="请输入歌曲编号" />
        </el-form-item>
        <el-form-item label="关注数" prop="followerNumber">
          <el-input v-model="form.followerNumber" placeholder="请输入关注数" />
        </el-form-item>
        <el-form-item label="专辑数" prop="albumNumber">
          <el-input v-model="form.albumNumber" placeholder="请输入专辑数" />
        </el-form-item>
        <el-form-item label="mv数" prop="mvNumber">
          <el-input v-model="form.mvNumber" placeholder="请输入mv数" />
        </el-form-item>
        <el-form-item label="详情" prop="detail">
          <el-input v-model="form.detail" placeholder="请输入详情" />
        </el-form-item>
        <el-form-item label="影响力" prop="influencePower">
          <el-input v-model="form.influencePower" placeholder="请输入影响力" />
        </el-form-item>
        <el-form-item label="认证信息" prop="certInfo">
          <el-input v-model="form.certInfo" placeholder="请输入认证信息" />
        </el-form-item>
        <el-form-item label="早期经历" prop="earlyExp">
          <el-input v-model="form.earlyExp" placeholder="请输入早期经历" />
        </el-form-item>
        <el-form-item label="演绎经历" prop="performingExp">
          <el-input v-model="form.performingExp" placeholder="请输入演绎经历" />
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
import { listSinger, getSinger, delSinger, addSinger, updateSinger, exportSinger } from "@/api/business/singer";

export default {
  name: "Singer",
  data() {
    return {
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
      // 歌手信息表格数据
      singerList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sinId: null,
        sinName: null,
        nickname: null,
        sex: null,
        year: null,
        sinType: null,
        followerNumber: null,
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
    /** 查询歌手信息列表 */
    getList() {
      this.loading = true;
      listSinger(this.queryParams).then(response => {
        this.singerList = response.rows;
        this.total = response.total;
        this.loading = false;
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
        sinId: null,
        sinName: null,
        nickname: null,
        sex: null,
        year: null,
        sinType: null,
        area: null,
        songNumber: null,
        followerNumber: null,
        albumNumber: null,
        mvNumber: null,
        detail: null,
        influencePower: null,
        certInfo: null,
        earlyExp: null,
        performingExp: null,
        delFlag: null,
        createTime: null,
        updateTime: null,
        delTime: null
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
      this.ids = selection.map(item => item.sinId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加歌手信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const sinId = row.sinId || this.ids
      getSinger(sinId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改歌手信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.sinId != null) {
            updateSinger(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addSinger(this.form).then(response => {
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
      const sinIds = row.sinId || this.ids;
      this.$confirm('是否确认删除歌手信息编号为"' + sinIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delSinger(sinIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有歌手信息数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportSinger(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    }
  }
};
</script>
