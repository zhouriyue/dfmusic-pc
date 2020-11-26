<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="套餐名" prop="smName">
        <el-input
          v-model="queryParams.smName"
          placeholder="请输入套餐名"
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
          v-hasPermi="['business:set_meal:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['business:set_meal:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['business:set_meal:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:set_meal:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="set_mealList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="唯一标识" align="center" prop="smId" />
      <el-table-column label="套餐名" align="center" prop="smName" />
      <el-table-column label="当前价格" align="center" prop="currentPrices">
        <template slot-scope="scope">
          <span style="font-size: 18px;color: #d81e06">{{scope.row.currentPrices}}<Img :src="renminbi" style="width: 10px;height: 10px;"/></span>
        </template>
      </el-table-column>
      <el-table-column label="原价" align="center" prop="costPrice">
        <template slot-scope="scope">
          <span style="font-size: 12px;">{{scope.row.costPrice}}<Img :src="renminbiBlank" style="width: 10px;height: 10px;"/></span>
        </template>
      </el-table-column>
      <el-table-column label="充值天数" align="center" prop="rechargeDay" />
      <el-table-column label="是否包月" align="center" prop="isSeries">
        <template slot-scope="scope">
          <span style="font-size: 12px;">{{scope.row.isSeries}}</span>
        </template>
      </el-table-column>
      <el-table-column label="详情" align="center" prop="detail">
        <template slot-scope="scope">
          <div v-if="scope.row.detail!=''||scope.row.detail!=null">
            <span style="font-size: 18px;color: #d81e06">{{scope.row.detail}}</span>
          </div>
          <div v-if="scope.row.detail==''||scope.row.detail==null">
            <span>无</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:set_meal:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:set_meal:remove']"
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

    <!-- 添加或修改套餐信息管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item class="item-magin" label="套餐名" prop="smName" required>
          <el-input v-model="form.smName" placeholder="请输入套餐名" />
        </el-form-item>
        <el-form-item class="item-magin" label="当前价格" prop="currentPrices" required>
          <el-input-number v-model="form.currentPrices" placeholder="请输入当前价格" :precision='2'></el-input-number>
        </el-form-item>
        <el-form-item class="item-magin" label="原价" prop="costPrice" required>
          <el-input-number v-model="form.costPrice" placeholder="请输入原价" :precision='2'></el-input-number>
        </el-form-item>
        <el-form-item class="item-magin" label="充值天数" prop="rechargeDay" required>
          <el-input-number v-model="form.rechargeDay" placeholder="请输入原价"></el-input-number>
        </el-form-item>
        <el-form-item class="item-magin" label="连续包月" prop="isSeries" required>
          <el-radio-group v-model="form.isSeries" size="medium">
            <el-radio v-for="(item, index) in isSeriesList" :key="index" :label="item.value">{{item.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item class="item-magin" label="详情" prop="detail" required>
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
import { listSet_meal, getSet_meal, delSet_meal, addSet_meal, updateSet_meal, exportSet_meal } from "@/api/business/set_meal";
import renminbi from "@/assets/icons/icon_renminbi.png";
import renminbiBlank from "@/assets/icons/renminbi_blank.png";

export default {
  name: "Set_meal",
  data() {
    return {
      isSeriesList: [{
        "label": "是",
        "value": 1
      }, {
        "label": "否",
        "value": 0
      }],
      renminbi: renminbi,
      renminbiBlank: renminbiBlank,
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
      // 套餐信息管理表格数据
      set_mealList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        smName: null,
        smType: null,
      },
      // 表单参数
      form: {
      },
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询套餐信息管理列表 */
    getList() {
      this.loading = true;
      listSet_meal(this.queryParams).then(response => {
        this.set_mealList = response.rows;
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
        smId: null,
        smName: null,
        currentPrices: null,
        costPrice: null,
        rechargeDay: null,
        smType: null,
        detail: null,
        isSeries: null
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
      this.ids = selection.map(item => item.smId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加套餐信息管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const smId = row.smId || this.ids
      getSet_meal(smId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改套餐信息管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.smId != null) {
            updateSet_meal(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addSet_meal(this.form).then(response => {
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
      const smIds = row.smId || this.ids;
      this.$confirm('是否确认删除套餐信息管理编号为"' + smIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delSet_meal(smIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有套餐信息管理数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportSet_meal(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    }
  }
};
</script>
<style>
  .item-magin{
    margin-right: 30px;
  }
</style>
