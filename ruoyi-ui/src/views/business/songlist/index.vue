<template>
  <div>
    <div v-if="showType==true">
      <div class="app-container">
        <!--搜索框-->
        <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
          <div style="display: flex;flex-wrap: wrap;">
            <el-form-item class="search-item" label="搜索" prop="wordKey">
              <el-input
                v-model="queryParams.wordKey"
                placeholder="歌单名/用户名/昵称"
                clearable
                size="small"
                @keyup.enter.native="handleQuery"
              />
            </el-form-item>
            <el-form-item class="search-item" label="创建时间" prop="field102">
              <el-date-picker v-model="queryParams.createTime" format="yyyy-MM-dd" value-format="yyyy-MM-dd"
                              :style="{width: '100%'}" placeholder="请选择创建时间" clearable></el-date-picker>
            </el-form-item>
            <el-form-item class="search-item" label="专辑" prop="field101">
              <el-select v-model="queryParams.isAlbum" placeholder="请选择" clearable :style="{width: '100%'}">
                <el-option v-for="(item, index) in albums" :key="index" :label="item.label"
                           :value="item.value" :disabled="item.disabled"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item class="search-item">
              <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
              <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
            </el-form-item>
          </div>
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
          <div class="change-bar-1">
            <div class="top-right-btn">
              <el-row>
                <el-tooltip class="item" effect="dark" :content="showType ? '切换到数据列表' : '切换到一览表'" placement="top">
                  <el-button size="mini" circle icon="el-icon-sort" @click="changeShowType()" />
                </el-tooltip>
              </el-row>
            </div>
          </div>
        </el-row>
        <!--列表显示-->
        <el-table v-loading="loading" :data="songlistList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" align="center"/>
          <el-table-column label="歌单名" width="120" align="center" prop="slName"/>
          <el-table-column label="歌单封面" width="80" align="center" prop="coverPicture">
            <template slot-scope="scope">
              <img :src="baseUrl+scope.row.coverPicture" alt="" style="width:60px;height:60px;">
            </template>
          </el-table-column>
          <el-table-column label="歌曲数" align="center" prop="songNumber"/>
          <el-table-column label="用户名" align="center" prop="userName"/>
          <el-table-column label="用户昵称" align="center" prop="nickName"/>
          <el-table-column label="专辑" align="center" prop="isAlbum">
            <template slot-scope="scope">
              <div v-if="scope.row.isAlbum==1">
                <span>是</span>
              </div>
              <div v-if="scope.row.isAlbum==0">
                <span>否</span>
              </div>
            </template>
          </el-table-column>
          <el-table-column label="是否公开" align="center" prop="isPublic">
            <template slot-scope="scope">
              <div v-if="scope.row.isPublic==1">
                <span>公开</span>
              </div>
              <div v-if="scope.row.isPublic==0">
                <span>私有</span>
              </div>
            </template>
          </el-table-column>
          <el-table-column label="创建时间" align="center" prop="createTime" width="120">
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
        <el-dialog :title="title" :visible.sync="open" width="550px" append-to-body>
          <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="80px">
            <el-form-item label="封面" prop="field101">
              <el-upload ref="field101"
                         :limit="1"
                         :file-list="field101fileList"
                         :action="field101Action"
                         :before-upload="field101BeforeUpload"
                         :on-success="handleSuccess"
                         list-type="picture-card">
                <i class="el-icon-plus"></i>
              </el-upload>
              <span id="upMess"></span>
            </el-form-item>
          </el-form>
          <el-form ref="form" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="歌单名" prop="slName" required class="input-magin">
              <el-input v-model="form.slName" placeholder="请输入歌单名"/>
            </el-form-item>
            <el-form-item label="详情" prop="detail" class="input-magin">
              <el-input v-model="form.detail" type="textarea" placeholder="请输入详情"
                        :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
            </el-form-item>
            <el-form-item label="专辑" prop="isAlbum">
              <el-radio-group v-model="form.isAlbum" size="medium">
                <el-radio v-for="(item, index) in iss" :key="index" :label="item.value"
                          :disabled="item.disabled">{{item.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
            <el-form-item label="公开" prop="isPublic">
              <el-radio-group v-model="form.isPublic" size="medium">
                <el-radio v-for="(item, index) in iss" :key="index" :label="item.value"
                          :disabled="item.disabled">{{item.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
            <el-form-item label="官方歌单" prop="isPublic">
              <el-radio-group v-model="form.isOff" size="medium">
                <el-radio v-for="(item, index) in iss" :key="index" :label="item.value"
                          :disabled="item.disabled">{{item.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
            <el-form-item label="用户" prop="user" style="margin-right:30px;">
              <el-select id="select" class="user-select" v-model="form.createById" placeholder="请选择用户" @change="inputData" clearable>
                <el-option v-for="(item, index) in this.userList" :key="index" :label="item.userName"
                           :value="item.userId" :disabled="item.disabled"></el-option>
              </el-select>
              <el-input id="input" @keyup.enter.native="selectUser" @click="selectUser" class="user-input" v-model="form.userName" placeholder="请输入歌手名"  clearable/>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitForm">确 定</el-button>
            <el-button @click="cancel">取 消</el-button>
          </div>
        </el-dialog>

        <!-- 添加歌曲对话框 -->
        <el-dialog :title="songtitle" :visible.sync="openAddSong" width="800px" append-to-body>
          <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
              <el-button
                type="success"
                icon="el-icon-edit"
                size="mini"
                :disabled="multiple"
                @click="handleAddToSl"
                v-hasPermi="['business:songlist:addSongToSl']"
              >点击收藏
              </el-button>
            </el-col>
          </el-row>
          <!--显示列表-->
          <el-table v-loading="loading" :data="songList" @selection-change="songSelectionChange">
            <el-table-column type="selection" width="55" align="center"/>
            <el-table-column label="歌曲名" align="center" prop="songName"/>
            <el-table-column label="歌单封面" width="80" align="center" prop="coverPicture">
              <template slot-scope="scope">
                <img :src="baseUrl+scope.row.coverPicture" alt="" style="width:60px;height:60px;">
              </template>
            </el-table-column>
            <el-table-column label="时长" align="center" prop="duration"/>
            <el-table-column label="发行时间" align="center" prop="issuingDate" width="180">
              <template slot-scope="scope">
                <span>{{ parseTime(scope.row.issuingDate, '{y}-{m}-{d}') }}</span>
              </template>
            </el-table-column>
            <el-table-column label="mv" align="center" prop="mvUrl">
              <template slot-scope="scope">
                <span v-if="scope.row.mvUrl==''||scope.row.mvUrl==null" style="font-size: 10px">无</span>
                <span v-if="scope.row.mvUrl==''||scope.row.mvUrl==null" style="font-size: 10px">
            {{scope.row.mvUrl}}
          </span>
              </template>
            </el-table-column>
          </el-table>
          <pagination
            v-show="songtotal>0"
            :total="songtotal"
            :page.sync="songParams.pageNum"
            :limit.sync="songParams.pageSize"
            @pagination="getSongList"
          />
        </el-dialog>
      </div>
    </div>
    <div v-if="showType==false">
      <div class="dashboard-editor-container">
        <div class="change-bar-2">
          <div class="top-right-btn">
            <el-row>
              <el-tooltip class="item" effect="dark" :content="showType ? '切换到数据列表' : '切换到一览表'" placement="top">
                <el-button size="mini" circle icon="el-icon-sort" @click="changeShowType()" />
              </el-tooltip>
            </el-row>
          </div>
        </div>
        <el-row :gutter="32">
          <el-col :xs="24" :sm="24" :lg="24">
            <div class="chart-wrapper">
              <div class="bar-main">
                <div class="songlist-item" v-for="(songlist,index) in songlists">
                  <router-link :to="{path:'/songlist/user-songlist',query:{songlist:songlist}}" class="link-type">
                    <div class="songlist-box">
                      <div class="play-number"><Img :src="play" style="width: 10px;height: 10px;margin-right: 3px"/>{{songlist.playNumber}}</div>
                      <Img class="songlist-url" :src="baseUrl+songlist.coverPicture"/>
                      <span class="create-by">周日月的歌单</span>
                    </div>
                    <div>
          <span class="sl-name">
            {{songlist.slName}}
          </span>
                    </div>
                  </router-link>
                </div>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </div>
  </div>

</template>

<script>
  require('echarts/theme/macarons') // echarts theme
  import {
    getSonglist,
    delSonglist,
    addSonglist,
    updateSonglist,
    exportSonglist,
    getSonglistDetail,
    searchSonglist,
    addSongToSl
  } from '@/api/business/songlist'
  import {selectUser} from "@/api/system/user";
  import {
    listSong
  } from '@/api/business/song'
  import arrowRight from '@/assets/icons/arrow_right.png'
  import play from '@/assets/icons/play.png'


  export default {
    name: 'Songlist',
    data() {
      return {
        play:play,
        arrowRight:arrowRight,
        songlists:[],
        showType: true,
        // 歌曲表格数据
        songList: [],
        baseUrl:'http://47.114.190.44',
        userList:[],
        iss: [{
          "label": "是",
          "value": 1
        }, {
          "label": "否",
          "value": 0
        }],
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
        songtotal:0,
        // 歌单表格数据
        songlistList: [],
        // 弹出层标题
        title: '',
        // 是否显示弹出层
        open: false,
        // 是否显示添加歌曲页
        openAddSong: false,
        songtitle:'',
        searchParams:{
          wordKey:'',
          createTime:null,
          isAlbum:null,
          pageSize:10,
          pageNum:1
        },
        songParams:{
          pageNum: 1,
          pageSize: 10,
        },
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
          ],
          user: [{
            required: true,
            message: '请选择下拉选择',
            trigger: 'change'
          }],
        },
        albums:[{
          "label": "否",
          "value": 0
        }, {
          "label": "是",
          "value": 1
        }],
        formData: {
          field101: null
        },
        addedSlId:0,
        rules: {},
        field101Action: 'http://127.0.0.1:8080/fdfs/upload',
        field101fileList: []
      }
    },
    created() {
      this.getList()
    },
    methods: {
      //获取歌曲列表
      getSongList() {
        listSong(this.songParams).then(response => {
          this.songList = response.rows
          this.songtotal = response.songtotal
        })
      },
      inputData(){
        for(var i = 0;i < this.userList.length;i++) {
          if(this.userList[i].userId==this.form.createById){
            this.form.userName = this.userList[i].userName
          }
        }
      },
      /** 查询歌单列表 */
      selectUser(){
        selectUser({userName:this.form.userName}).then(response => {
          this.userList = response.rows
          document.getElementById("select").click()
        })

      },
      getList() {
        this.loading = true
        getSonglistDetail(this.queryParams).then(response => {
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
        searchSonglist(this.queryParams).then(response => {
          this.songlistList = response.rows
          this.total = response.total
          this.loading = false
        })
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.resetForm('queryForm')
        this.handleQuery()
      },
      songSelectionChange(selection){
        this.songIds = selection.map(item => item.songId)
        this.single = selection.length !== 1
        this.multiple = !selection.length
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
        this.field101fileList = []
        this.open = true
        this.title = '添加歌单'
      },
      /** 添加歌曲操作 */
      handleAddToSl(row) {
        const songIds = row.songId || this.songIds
        this.songParams.songIds = songIds;
        this.songParams.slId = this.addedSlId;
        if(this.form.isAlbum==null) {
          this.songParams.isAlbum = 0
        } else {
          this.songParams.isAlbum = this.form.isAlbum
        }
        addSongToSl(this.songParams).then(response => {
          this.msgSuccess('添加成功')
        })
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset()
        this.field101fileList = [{name: '',url: this.baseUrl+row.coverPicture}]
        const slId = row.slId || this.ids
        getSonglist(slId).then(response => {
          this.form = response.data
          this.form.userName = this.form.createById
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
                  this.openAddSong = true
                  this.songtitle = '添加歌曲'
                  this.addedSlId = response.data
                  this.getSongList(this.songParams);
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
      handleSuccess(response, file, fileList){
        this.form.coverPicture = response
      },
      field101BeforeUpload(file) {
          let isRightSize = file.size / 1024 / 1024 < 2
          if (!isRightSize) {
            alert('文件大小超过 2MB！')
          }
          return isRightSize
      },
      changeShowType(){
        if(this.showType){
          getSonglistDetail({pageNum:1,pageSize:18}).then(response => {
              this.songlists = response.rows
          })
          this.showType = false;
        } else {
          this.showType = true;
        }
      }
    }
  }
</script>
<style lang="scss" scoped>
  .top-right-btn {
    position: relative;
    float: right;
    margin-right: 10px;
  }
  .user-select{
    width: 100%;
  }
  .user-input{
    width: 100%;
    position: relative;
    top: -38px;
  }
  .search-item {
    float: left;
  }
  .search-item{
    float: left;
  }
  .input-magin{
    margin-right: 30px
  }
  .information-title {
    color: #19d3ea;
    font-size: 12px;
    width: 100px;   /*一定要设置宽度，或者元素内含的百分比*/
    overflow:hidden; /*溢出的部分隐藏*/
    white-space: nowrap; /*文本不换行*/
    text-overflow:ellipsis;/*ellipsis:文本溢出显示省略号（...）；clip：不显示省略标记（...），而是简单的裁切*/
  }

  /* 一览表css */
  .change-bar-2{
    position: absolute;
    right: 5px;
    top: 5px;
  }
  .change-bar-1{
  }
  .zf-item{
    margin: 5px 10px;
  }
  .zf{
    display: flex;
    flex-wrap: wrap;
  }
  .select{
    font-size: 13px;
    color: #707070;
    margin-left: 10px;
  }
  .cover-h{
    width: 110px;
    height: 110px;
    background-color: rgba(0, 0, 0, 0);
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
  }
  .cover-h:hover{
    width: 150px;
    height: 150px;
    background-color: rgba(0, 0, 0, 0.1);
    position: absolute;
    color: white;
    left: 0;
    bottom: 0;
    width: 100%;
    border-radius: 3px;
  }
  .sl-name{
    margin: 10px 0px;
    font-size: 14px;
    color: #707070;
  }
  .create-by{
    padding: 5px;
    font-size: 11px;
    color: #ffffff;
    left: 0;
    bottom: 0;
    width: 100%;
    border-radius: 0px 0px 3px 3px;
    background-color: rgba(0, 0, 0, 0.2);
    position: absolute;
  }
  .play-number{
    position: absolute;
    top: 5px;
    right: 10px;
    color: #ffffff;
    font-size: 14px;
  }
  .songlist-url{
    width: 150px;
    height: 150px;
    border-radius: 3px;
  }

  .songlist-box{
    width: 150px;
    height: 150px;
    position: relative;
  }
  .songlist-item{
    margin: 20px 10px;
  }
  .bar-main{
    display:flex;
    flex-wrap: wrap;
    font-family: "Microsoft YaHei";
  }
  .dashboard-editor-container {
    padding: 32px;
    background-color: rgb(240, 242, 245);
    position: relative;

  .chart-wrapper {
    background: #fff;
    padding: 32px;
  }
  }
</style>
