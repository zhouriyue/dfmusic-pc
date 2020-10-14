<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="歌曲id" prop="songId">
        <el-input
          v-model="queryParams.songId"
          placeholder="请输入歌曲id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌曲名" prop="songName">
        <el-input
          v-model="queryParams.songName"
          placeholder="请输入歌曲名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌手id" prop="sinId">
        <el-input
          v-model="queryParams.sinId"
          placeholder="请输入歌手id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发行时间" prop="issuingDate">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.issuingDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择发行时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="是否收费" prop="isCharge">
        <el-input
          v-model="queryParams.isCharge"
          placeholder="请输入是否收费"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否有版权" prop="isCopyright">
        <el-input
          v-model="queryParams.isCopyright"
          placeholder="请输入是否有版权"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否是单曲" prop="isSingle">
        <el-input
          v-model="queryParams.isSingle"
          placeholder="请输入是否是单曲"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌单id" prop="slId">
        <el-input
          v-model="queryParams.slId"
          placeholder="请输入歌单id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌词id" prop="lyrId">
        <el-input
          v-model="queryParams.lyrId"
          placeholder="请输入歌词id"
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
      <el-form-item label="更新时间" prop="updateTime">
        <el-date-picker clearable size="small" style="width: 200px"
          v-model="queryParams.updateTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="选择更新时间">
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
          v-hasPermi="['business:song:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['business:song:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['business:song:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:song:export']"
        >导出</el-button>
      </el-col>
	  <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="songList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="歌曲id" align="center" prop="songId" />
      <el-table-column label="歌曲名" align="center" prop="songName" />
      <el-table-column label="歌手id" align="center" prop="sinId" />
      <el-table-column label="时长" align="center" prop="duration" />
      <el-table-column label="发行时间" align="center" prop="issuingDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.issuingDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="mv" align="center" prop="mvUrl" />
      <el-table-column label="是否收费" align="center" prop="isCharge" />
      <el-table-column label="是否有版权" align="center" prop="isCopyright" />
      <el-table-column label="是否是单曲" align="center" prop="isSingle" />
      <el-table-column label="歌单id" align="center" prop="slId" />
      <el-table-column label="标注音质(S)" align="center" prop="standardUrl" />
      <el-table-column label="高品质" align="center" prop="hqUrl" />
      <el-table-column label="超音质" align="center" prop="sqUrl" />
      <el-table-column label="无损" align="center" prop="witPreUrl" />
      <el-table-column label="歌词id" align="center" prop="lyrId" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:song:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:song:remove']"
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

    <!-- 添加或修改歌曲对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="歌曲名" prop="songName">
          <el-input v-model="form.songName" placeholder="请输入歌曲名" />
        </el-form-item>
        <el-form-item label="歌手id" prop="sinId">
          <el-input v-model="form.sinId" placeholder="请输入歌手id" />
        </el-form-item>
        <el-form-item label="时长" prop="duration">
          <el-input v-model="form.duration" placeholder="请输入时长" />
        </el-form-item>
        <el-form-item label="发行时间" prop="issuingDate">
          <el-date-picker clearable size="small" style="width: 200px"
            v-model="form.issuingDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="选择发行时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="mv" prop="mvUrl">
          <el-input v-model="form.mvUrl" placeholder="请输入mv" />
        </el-form-item>
        <el-form-item label="是否收费" prop="isCharge">
          <el-input v-model="form.isCharge" placeholder="请输入是否收费" />
        </el-form-item>
        <el-form-item label="是否有版权" prop="isCopyright">
          <el-input v-model="form.isCopyright" placeholder="请输入是否有版权" />
        </el-form-item>
        <el-form-item label="是否是单曲" prop="isSingle">
          <el-input v-model="form.isSingle" placeholder="请输入是否是单曲" />
        </el-form-item>
        <el-form-item label="歌单id" prop="slId">
          <el-input v-model="form.slId" placeholder="请输入歌单id" />
        </el-form-item>
        <el-form-item label="标注音质(S)" prop="standardUrl">
          <el-input v-model="form.standardUrl" placeholder="请输入标注音质(S)" />
        </el-form-item>
        <el-form-item label="高品质" prop="hqUrl">
          <el-input v-model="form.hqUrl" placeholder="请输入高品质" />
        </el-form-item>
        <el-form-item label="超音质" prop="sqUrl">
          <el-input v-model="form.sqUrl" placeholder="请输入超音质" />
        </el-form-item>
        <el-form-item label="无损" prop="witPreUrl">
          <el-input v-model="form.witPreUrl" placeholder="请输入无损" />
        </el-form-item>
        <el-form-item label="歌词id" prop="lyrId">
          <el-input v-model="form.lyrId" placeholder="请输入歌词id" />
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
import { listSong, getSong, delSong, addSong, updateSong, exportSong } from "@/api/business/song";

export default {
  name: "Song",
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
      // 歌曲表格数据
      songList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        songId: null,
        songName: null,
        sinId: null,
        issuingDate: null,
        isCharge: null,
        isCopyright: null,
        isSingle: null,
        slId: null,
        lyrId: null,
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
    /** 查询歌曲列表 */
    getList() {
      this.loading = true;
      listSong(this.queryParams).then(response => {
        this.songList = response.rows;
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
        songId: null,
        songName: null,
        sinId: null,
        duration: null,
        issuingDate: null,
        mvUrl: null,
        isCharge: null,
        isCopyright: null,
        isSingle: null,
        slId: null,
        standardUrl: null,
        hqUrl: null,
        sqUrl: null,
        witPreUrl: null,
        lyrId: null,
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
      this.ids = selection.map(item => item.songId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加歌曲";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const songId = row.songId || this.ids
      getSong(songId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改歌曲";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.songId != null) {
            updateSong(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addSong(this.form).then(response => {
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
      const songIds = row.songId || this.ids;
      this.$confirm('是否确认删除歌曲编号为"' + songIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delSong(songIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有歌曲数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportSong(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    }
  }
};
</script>
