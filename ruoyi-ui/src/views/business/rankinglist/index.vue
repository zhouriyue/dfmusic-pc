<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="排行榜名" prop="rlName">
        <el-input
          v-model="queryParams.rlName"
          placeholder="请输入排行榜名"
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
          v-hasPermi="['business:rankinglist:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['business:rankinglist:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['business:rankinglist:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:rankinglist:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="rankinglistList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="名称" align="center" prop="rlName" />
      <el-table-column label="官方" align="center" prop="isOff">
        <template slot-scope="scope">
          <div v-if="scope.row.isOff==1">
            <span>是</span>
          </div>
          <div v-if="scope.row.isOff==0">
            <span>否</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="图片" align="center" prop="slPicture" >
        <template slot-scope="scope">
          <img :src="baseUrl+scope.row.slPicture" alt="" style="width:60px;height:60px;">
        </template>
      </el-table-column>
      <el-table-column label="类型" align="center" prop="rlType" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:rankinglist:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:rankinglist:remove']"
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

    <!-- 添加或修改排行榜管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="elForm" :model="form" :rules="rules" size="medium" label-width="80px">
        <el-form-item label="封面" prop="field101">
          <el-upload ref="field101"
                     :limit="1"
                     :file-list="field101fileList"
                     :action="field101Action"
                     :on-success="handleSuccess"
                     list-type="picture-card">
            <i class="el-icon-plus"></i>
          </el-upload>
          <span id="upMess"></span>
        </el-form-item>
      </el-form>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="排行榜名" prop="rlName">
          <el-input v-model="form.rlName" placeholder="请输入排行榜名称" />
        </el-form-item>
        <el-form-item label="官方" >
          <el-radio-group v-model="form.isOff">
            <el-radio
              v-for="dict in statusOptions"
              :key="dict.dictValue"
              :label="dict.dictValue"
            >{{dict.dictLabel}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="排行类型" prop="rlType">
          <el-select v-model="form.rlType" placeholder="请选择排行类型">
            <el-option
              v-for="item in songtypeList"
              :key="item.stId"
              :label="item.stName"
              :value="item.stId"
              :disabled="item.status == 1"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item class="item-magin" label="详情" prop="detail">
          <el-input v-model="form.detail" type="textarea" placeholder="请输入详情"
                    :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
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
import { listRankinglist, getRankinglist, delRankinglist, addRankinglist, updateRankinglist, exportRankinglist } from "@/api/business/rankinglist";
import { listSongtype} from "@/api/business/songtype";
export default {
  name: "Rankinglist",
  data() {
    return {
      songtypeList:[],
      statusOptions:[],
      field101Action: 'http://127.0.0.1:8080/fdfs/upload',
      field101fileList: [],
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
      // 排行榜管理表格数据
      rankinglistList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        rlName: null,
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
    // 字典状态字典翻译
    statusFormat(row, column) {
      return this.selectDictLabel(this.statusOptions, row.status);
    },
    /** 查询排行榜管理列表 */
    getList() {
      this.loading = true;
      listRankinglist(this.queryParams).then(response => {
        this.rankinglistList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
      this.getDicts("status_is").then(response => {
        this.statusOptions = response.data;
      });
      listSongtype().then(response => {
        this.songtypeList = response.rows;
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
        rlId: null,
        rlName: null,
        isOff: 0,
        slPicture: null,
        rlType: null
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
      this.ids = selection.map(item => item.rlId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.field101fileList = []
      this.open = true;
      this.title = "添加排行榜管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const rlId = row.rlId || this.ids
      getRankinglist(rlId).then(response => {
        this.form = response.data;
        this.field101fileList = [{name:'',url:this.baseUrl+row.slPicture}]
        this.open = true;
        this.title = "修改排行榜管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.rlId != null) {
            updateRankinglist(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addRankinglist(this.form).then(response => {
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
      const rlIds = row.rlId || this.ids;
      this.$confirm('是否确认删除排行榜管理编号为"' + rlIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delRankinglist(rlIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有排行榜管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportRankinglist(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    },
    handleSuccess(response, file, fileList){
      this.form.slPicture = response
    }
  }
};
</script>
