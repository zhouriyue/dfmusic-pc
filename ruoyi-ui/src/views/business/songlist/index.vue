<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="歌单id" prop="slId">
        <el-input
          v-model="queryParams.slId"
          placeholder="请输入歌单id"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌单名" prop="slName">
        <el-input
          v-model="queryParams.slName"
          placeholder="请输入歌单名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌单封面" prop="coverPicture">
        <el-input
          v-model="queryParams.coverPicture"
          placeholder="请输入歌单封面"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="标题" prop="slTitle">
        <el-input
          v-model="queryParams.slTitle"
          placeholder="请输入标题"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="播放量" prop="playNumber">
        <el-input
          v-model="queryParams.playNumber"
          placeholder="请输入播放量"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌曲数" prop="songNumber">
        <el-input
          v-model="queryParams.songNumber"
          placeholder="请输入歌曲数"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="收藏量" prop="colNumber">
        <el-input
          v-model="queryParams.colNumber"
          placeholder="请输入收藏量"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="评论量" prop="commentsNumber">
        <el-input
          v-model="queryParams.commentsNumber"
          placeholder="请输入评论量"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="分享量" prop="shareNumber">
        <el-input
          v-model="queryParams.shareNumber"
          placeholder="请输入分享量"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌单创建者" prop="createBy">
        <el-input
          v-model="queryParams.createBy"
          placeholder="请输入歌单创建者"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="详情" prop="detail">
        <el-input
          v-model="queryParams.detail"
          placeholder="请输入详情"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否是专辑" prop="isAlbum">
        <el-input
          v-model="queryParams.isAlbum"
          placeholder="请输入是否是专辑"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="歌手" prop="sinId">
        <el-input
          v-model="queryParams.sinId"
          placeholder="请输入歌手"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否公开" prop="isPublic">
        <el-input
          v-model="queryParams.isPublic"
          placeholder="请输入是否公开"
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
          v-hasPermi="['business:songlist:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['business:songlist:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['business:songlist:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:songlist:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="songlistList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="歌单id" align="center" prop="slId"/>
      <el-table-column label="歌单名" align="center" prop="slName"/>
      <el-table-column label="歌单封面" align="center" prop="coverPicture"/>
      <el-table-column label="标题" align="center" prop="slTitle"/>
      <el-table-column label="播放量" align="center" prop="playNumber"/>
      <el-table-column label="歌曲数" align="center" prop="songNumber"/>
      <el-table-column label="收藏量" align="center" prop="colNumber"/>
      <el-table-column label="评论量" align="center" prop="commentsNumber"/>
      <el-table-column label="分享量" align="center" prop="shareNumber"/>
      <el-table-column label="歌单创建者" align="center" prop="createBy"/>
      <el-table-column label="详情" align="center" prop="detail"/>
      <el-table-column label="是否是专辑" align="center" prop="isAlbum"/>
      <el-table-column label="歌手" align="center" prop="sinId"/>
      <el-table-column label="是否公开" align="center" prop="isPublic"/>
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
            v-hasPermi="['business:songlist:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:songlist:remove']"
          >删除
          </el-button>
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

    <!-- 添加或修改歌单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="80px">
        <el-form-item label="上传" prop="field101" required>
          <el-upload ref="field101" :file-list="field101fileList" :action="field101Action"
                     :before-upload="field101BeforeUpload" :on-remove="handleRemove" list-type="picture-card">
            <i class="el-icon-plus"></i>
          </el-upload>
          <span id="upMess"></span>
        </el-form-item>
        <el-form-item>
          <el-button @click="close">取消</el-button>
          <el-button type="primary" @click="handelConfirm">确定</el-button>
        </el-form-item>
      </el-form>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="歌单名" prop="slName" required>
          <el-input v-model="form.slName" placeholder="请输入歌单名"/>
        </el-form-item>
        <el-form-item label="标题" prop="slTitle" required>
          <el-input v-model="form.slTitle" placeholder="请输入标题"/>
        </el-form-item>
        <el-form-item label="播放量" prop="playNumber" required>
          <el-input v-model="form.playNumber" placeholder="请输入播放量"/>
        </el-form-item>
        <el-form-item label="歌曲数" prop="songNumber" required>
          <el-input v-model="form.songNumber" placeholder="请输入歌曲数"/>
        </el-form-item>
        <el-form-item label="收藏量" prop="colNumber" required>
          <el-input v-model="form.colNumber" placeholder="请输入收藏量"/>
        </el-form-item>
        <el-form-item label="评论量" prop="commentsNumber" required>
          <el-input v-model="form.commentsNumber" placeholder="请输入评论量"/>
        </el-form-item>
        <el-form-item label="分享量" prop="shareNumber" required>
          <el-input v-model="form.shareNumber" placeholder="请输入分享量"/>
        </el-form-item>
        <el-form-item label="详情" prop="detail" required>
          <el-input v-model="form.detail" placeholder="请输入详情"/>
        </el-form-item>
        <el-form-item label="是否是专辑" prop="isAlbum" required>
          <el-input v-model="form.isAlbum" placeholder="请输入是否是专辑"/>
        </el-form-item>
        <el-form-item label="歌手" prop="sinId" required>
          <el-input v-model="form.sinId" placeholder="请输入歌手"/>
        </el-form-item>
        <el-form-item label="是否公开" prop="isPublic" required>
          <el-input v-model="form.isPublic" placeholder="请输入是否公开"/>
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
  import {
    listSonglist,
    getSonglist,
    delSonglist,
    addSonglist,
    updateSonglist,
    exportSonglist
  } from '@/api/business/songlist'

  export default {
    name: 'Songlist',
    data() {
      return {
        currentFileNumber:0,
        maxFileNumber:1,
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
        // 歌单表格数据
        songlistList: [],
        // 弹出层标题
        title: '',
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          slId: null,
          slName: null,
          coverPicture: null,
          slTitle: null,
          playNumber: null,
          songNumber: null,
          colNumber: null,
          commentsNumber: null,
          shareNumber: null,
          createBy: null,
          detail: null,
          isAlbum: null,
          sinId: null,
          isPublic: null,
          createTime: null,
          updateTime: null
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          slName: [
            { required: true, message: '歌单名不能为空', trigger: 'blur' }
          ],
          delFlag: [
            { required: true, message: '删除标识符不能为空', trigger: 'blur' }
          ]
        },
        formData: {
          field101: null
        },
        rules: {},
        field101Action: 'https://jsonplaceholder.typicode.com/posts/',
        field101fileList: []
      }
    },
    created() {
      this.getList()
    },
    methods: {
      /** 查询歌单列表 */
      getList() {
        this.loading = true
        listSonglist(this.queryParams).then(response => {
          this.songlistList = response.rows
          this.total = response.total
          this.loading = false
        })
      },
      // 取消按钮
      cancel() {
        this.open = false
        this.reset()
      },
      // 表单重置
      reset() {
        this.form = {
          slId: null,
          slName: null,
          coverPicture: null,
          slTitle: null,
          playNumber: null,
          songNumber: null,
          colNumber: null,
          commentsNumber: null,
          shareNumber: null,
          createBy: null,
          detail: null,
          isAlbum: null,
          sinId: null,
          isPublic: null,
          createTime: null,
          updateTime: null,
          delTime: null,
          delFlag: null
        }
        this.resetForm('form')
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.pageNum = 1
        this.getList()
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.resetForm('queryForm')
        this.handleQuery()
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.slId)
        this.single = selection.length !== 1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset()
        this.open = true
        this.title = '添加歌单'
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset()
        const slId = row.slId || this.ids
        getSonglist(slId).then(response => {
          this.form = response.data
          this.open = true
          this.title = '修改歌单'
        })
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs['form'].validate(valid => {
          if (valid) {
            if (this.form.slId != null) {
              updateSonglist(this.form).then(response => {
                if (response.code === 200) {
                  this.msgSuccess('修改成功')
                  this.open = false
                  this.getList()
                }
              })
            } else {
              addSonglist(this.form).then(response => {
                if (response.code === 200) {
                  this.msgSuccess('新增成功')
                  this.open = false
                  this.getList()
                }
              })
            }
          }
        })
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const slIds = row.slId || this.ids
        this.$confirm('是否确认删除歌单编号为"' + slIds + '"的数据项?', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(function() {
          return delSonglist(slIds)
        }).then(() => {
          this.getList()
          this.msgSuccess('删除成功')
        }).catch(function() {
        })
      },
      /** 导出按钮操作 */
      handleExport() {
        const queryParams = this.queryParams
        this.$confirm('是否确认导出所有歌单数据项?', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(function() {
          return exportSonglist(queryParams)
        }).then(response => {
          this.download(response.msg)
        }).catch(function() {
        })
      },
      handleRemove(){
        if(this.currentFileNumber>0){
          this.currentFileNumber--;
        }
      },
      handelConfirm() {
        this.$refs['elForm'].validate(valid => {
          if (!valid) return
          this.close()
        })
      },
      field101BeforeUpload(file) {
        if(this.currentFileNumber<this.maxFileNumber){
          let isRightSize = file.size / 1024 / 1024 < 2
          if (!isRightSize) {
            alert('文件大小超过 2MB！')
          }
          this.currentFileNumber++;
          return isRightSize
        } else {
          alert('上传文件数最多为1张！')
          return 0
        }
      }
    }
  }
</script>
<style>
  .el-upload__tip {
    line-height: 1.2;
  }

</style>
