<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <div style="display: flex;flex-wrap: wrap;">
        <el-form-item class="search-item" label="搜索" prop="songName">
          <el-input
            v-model="queryParams.songName"
            placeholder="请输入歌曲名/歌手/专辑"
            clearable
            size="small"
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item class="search-item" label="发行时间" prop="issuingDate">
          <el-date-picker v-model="queryParams.issuingDate" format="yyyy-MM-dd" value-format="yyyy-MM-dd"
                          :style="{width: '100%'}" placeholder="请选择发行时间" clearable></el-date-picker>
        </el-form-item>
        <el-form-item class="search-item" label="收费" prop="isCharge">
          <el-select v-model="queryParams.isCharge" placeholder="收费选项" clearable :style="{width: '100%'}">
            <el-option v-for="(item, index) in elSelects" :key="index" :label="item.label"
                       :value="item.value" :disabled="item.disabled"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item class="search-item" label="版权" prop="isCopyright">
          <el-select v-model="queryParams.isCopyright" placeholder="版权选项" clearable :style="{width: '100%'}">
            <el-option v-for="(item, index) in elSelects" :key="index" :label="item.label"
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
          v-if="queryParams.isCopyright==1"
          type="danger"
          icon="el-icon-edit"
          size="mini"
          :disabled="multiple"
          @click="handleOffSong"
          v-hasPermi="['business:song:offs']"
        >下架
        </el-button>
        <el-button
          v-if="queryParams.isCopyright==0"
          type="danger"
          icon="el-icon-edit"
          size="mini"
          :disabled="multiple"
          @click="handleOffSong"
          v-hasPermi="['business:song:offs']"
        >上线
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['business:song:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      <div class="change-bar-1">
        <div class="top-right-btn">
          <el-row>
            <el-tooltip class="item" effect="dark" :content="queryParams.isCopyright ? '切换到下架列表' : '切换到线上列表'" placement="top">
              <el-button size="mini" circle icon="el-icon-sort" @click="showIsCopyRight"/>
            </el-tooltip>
          </el-row>
        </div>
      </div>
    </el-row>

    <!--显示列表-->
    <el-table v-loading="loading" :data="songList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="歌曲名" align="center" prop="songName"/>
      <el-table-column label="歌单封面" width="80" align="center" prop="coverPicture">
        <template slot-scope="scope">
          <img :src="baseUrl+scope.row.coverPicture" alt="" style="width:60px;height:60px;">
        </template>
      </el-table-column>
      <el-table-column label="时长" align="center" prop="duration">
        <template slot-scope="scope">
          <span>{{parseInt(scope.row.duration/60)}}:{{parseInt(scope.row.duration%60)}}</span>
        </template>
      </el-table-column>
      <el-table-column label="发行时间" align="center" prop="issuingDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.issuingDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="收费" align="center" prop="isCharge">
        <template slot-scope="scope">
          <span v-if="scope.row.isCharge==1" style="font-size: 10px">是</span>
          <span v-if="scope.row.isCharge==0" style="font-size: 10px">否</span>
        </template>
      </el-table-column>
      <el-table-column label="版权" align="center" prop="isCopyright">
        <template slot-scope="scope">
          <span v-if="scope.row.isCopyright==1" style="font-size: 10px">是</span>
          <span v-if="scope.row.isCopyright==0" style="font-size: 10px">否</span>
        </template>
      </el-table-column>
      <el-table-column label="专辑" align="center" prop="songlistes.slName"/>
      <el-table-column label="歌手" align="center" prop="songlistes.slName">
        <template slot-scope="scope">
          <span>
            {{scope.row.singerList[0].sinName}}
          </span>
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
            v-if="queryParams.isCopyright==1"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleOff(scope.row)"
            v-hasPermi="['business:song:edit']"
          >下架</el-button>
            <el-button
              v-if="queryParams.isCopyright==0"
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleOff(scope.row)"
              v-hasPermi="['business:song:edit']"
            >上线
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
  </div>
</template>

<script>
  import {
    listSong,
    exportSong,
    selectSingerKey,
    searchSonglistKey,
    offSongs
  } from '@/api/business/song'
  import { listSongtype} from "@/api/business/songtype";
  import fork from '@/assets/icons/icon_fork.png'
  import forkSel from '@/assets/icons/icon_fork_sel.png'

  export default {
    name: 'Song',
    data() {
      return {
        showType:true,
        songTypeList:[],
        elSelects:[{
          "label": "否",
          "value": 0
        }, {
          "label": "是",
          "value": 1
        }],
        field101Action: 'http://127.0.0.1:8080/fdfs/upload',
        field101fileList: [],
        baseUrl: 'http://47.114.190.44',
        //标准音质列表
        standardUrlList: [],
        //超高音质列表
        hqUrlList: [],
        //超高音质列表
        sqUrlList: [],
        //无损文件列表
        witPreUrlList: [],
        //歌词文件列表
        lyrfileList: [],
        radioValue: [{
          'label': '是',
          'value': 1
        }, {
          'label': '否',
          'value': 0
        }],
        mvfileListAction: 'http://127.0.0.1:8080/fdfs/upload',
        mvfileList: [],
        fork: fork,
        forks: [fork, forkSel],
        forkSel: forkSel,
        selectSingers: [],
        singer: '',
        singers: [],
        songlist:{},
        songlists:[],
        selectkey: '',
        songlistkey:'',
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
        title: '',
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
          isCopyright: 1,
          isSingle: null,
          slId: null,
          lyrId: null,
          createTime: null,
          updateTime: null
        },
        min: 0,
        ss: 0.0,
        // 表单参数
        form: {},
        // 表单校验
        rules: {}
      }
    },
    created() {
      this.getList()
    },
    methods: {
      showIsCopyRight(){
        if(this.queryParams.isCopyright==1) {
          this.queryParams.isCopyright = 0
        } else {
          this.queryParams.isCopyright = 1
        }
        this.ids = []
        this.getList()
      },
      standardUrlUploadSuccess(response, file, fileList) {
        this.form.standardUrl = response
      },
      hqUrlUploadSuccess(response, file, fileList) {
        this.form.hqUrl = response
      },
      sqUrlUploadSuccess(response, file, fileList) {
        this.form.sqUrl = response
      },
      lyrUploadSuccess(response, file, fileList) {
        this.form.lyrUrl = response
      },
      mvUploadSuccess(response, file, fileList) {
        this.form.mvUrl = response
      },
      deleteSinger(sinId) {
        for (var i = 0; i < this.selectSingers.length; i++) {
          if (this.selectSingers[i].sinId == sinId) {
            this.selectSingers.splice(i, 1)
          }
        }

      },
      /** 获取查询歌手 */
      selectSinger(e) {
        var that = this
        if (that.singer != '') {
          this.selectSingers.push(that.singer)
        }
      },
      selectSonglist(){
        if(this.songlist!=null||this.songlist!='') {
          this.form.slId = this.songlist.slId
          this.form.slName = this.songlist.slName
          this.songlistkey = this.songlist.slName
        }
      },
      clickSelectSinger() {
        var singerSelect = document.getElementById('singer_select')
        selectSingerKey({ key: this.selectkey }).then(response => {
          this.singers = response
        })
        singerSelect.click()
      },
      /** 获取搜索歌单 **/
      clickSelectSonglist(){
        var songlistSelect = document.getElementById('songlist_select')
        searchSonglistKey({slName: this.songlistkey,isAlbum:1}).then(response => {
          this.songlists = response.rows
        })
        songlistSelect.click()
      },
      updateImg(id) {
        this.fork = this.forks[id]
      },
      /** 查询歌曲列表 */
      getList() {
        this.loading = true
        listSong(this.queryParams).then(response => {
          this.songList = response.rows
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
        this.ids = selection.map(item => item.songId)
        this.single = selection.length !== 1
        this.multiple = !selection.length
      },
      /** 修改按钮操作 */
      handleOff(row) {
        if(this.queryParams.isCopyright == 1){
          row.isCopyright = 0
        } else {
          row.isCopyright = 1
        }
        offSong(row).then(response => {
          if (response.code === 200) {
            this.msgSuccess('下架成功')
            this.getList()
          }
        })
      },
      /** 上下架歌曲按钮操作 */
      handleOffSong(row) {
        const songIds = row.songId || this.ids
        var code = ''
        var paramer = {};
        paramer.songIds = songIds
        if(this.queryParams.isCopyright==1) {
          code = "下架"
          paramer.isCopyright = 0
        } else {
          code = "上线"
          paramer.isCopyright = 1
        }
        this.$confirm('是否确认'+code+'歌曲编号为"' + songIds + '"的数据项?', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(function() {
          return offSongs(paramer)
        }).then(() => {
          this.getList()
          this.msgSuccess('操作成功')
        }).catch(function() {
        })
      },
      /** 导出按钮操作 */
      handleExport() {
        const queryParams = this.queryParams
        this.$confirm('是否确认导出所有歌曲数据项?', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(function() {
          return exportSong(queryParams)
        }).then(response => {
          this.download(response.msg)
        }).catch(function() {
        })
      },
      handleSuccess(response, file, fileList) {
        this.form.coverPicture = response
      }
    }
  }
</script>
<style>
  .top-right-btn {
    position: relative;
    float: right;
    margin-right: 10px;
  }
  .text-item{
    color: #707070;
    font-size: 12px;
  }
  .item-magin{
    margin-right: 30px
  }
  /* 一览表css */
  .change-bar-2{
    position: absolute;
    right: 5px;
    top: 5px;
  }
  .change-bar-1{
  }
  .search-item {
    float: left;
  }

  .img {
    width: 15px;
    height: 15px;
    position: relative;
    top: 4px;
    left: 4px;
  }

  .select-singer {
    position: relative;
    top: -30px;
    margin-left: 5px;
    font-size: 12px;
    width: 150px;
    height: 40px;
    border-radius: 25px;
    padding: 5px 10px 5px 10px;
    background-color: rgba(0, 0, 0, 0.15);
  }

  .select {
    position: relative;
    top: -36.78px;
  }

  .item-magin {
    margin-right: 30px;
    height: 60px;
  }
</style>
