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
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['business:song:add']"
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
          v-hasPermi="['business:song:edit']"
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
          v-hasPermi="['business:song:remove']"
        >删除
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
      <div class="change-bar-2">
        <div class="top-right-btn">
          <el-row>
            <el-tooltip class="item" effect="dark" :content="showType ? '切换到数据列表' : '切换到一览表'" placement="top">
              <el-button size="mini" circle icon="el-icon-sort" @click="changeShowType()" />
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
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:lyric:add']"
          >添加歌词</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['business:song:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['business:song:remove']"
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

    <!-- 添加或修改歌曲对话框 -->
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
        <el-form-item label="歌曲名" prop="songName" class="item-magin">
          <el-input v-model="form.songName" placeholder="请输入歌曲名"/>
        </el-form-item>
        <el-form-item label="歌手" class="item-magin">
          <div style="display:flex;flex-wrap: wrap;">
            <div style="width: 70%;">
              <el-select id="singer_select" v-model="form.sinIds" multiple placeholder="请选择歌手" style="width: 100%;">
                <el-option
                  v-for="item in singers"
                  :key="item.sinId"
                  :label="item.sinName"
                  :value="item.sinId"
                  :disabled="item.status == 1"
                ></el-option>
              </el-select>
            </div>
            <div style="width: 30%;position: relative;top:37px;">
              <el-input v-model="selectkey" placeholder="请输入信息"
                        class="select"
                        @keyup.enter.native="clickSelectSinger"
                        v-on:change="clickSelectSinger"
                        v-on:input="clickSelectSinger"/>
            </div>
          </div>
        </el-form-item>
        <el-form-item label="专辑" class="item-magin">
          <el-select id="songlist_select" v-model="songlist" placeholder="请选择专辑" v-on:change="selectSonglist" style="width: 100%;">
            <el-option
              v-for="item in songlists"
              :key="item.slId"
              :label="item.slName"
              :value="item"
            ></el-option>
          </el-select>
          <el-input v-model="songlistkey" placeholder="请输入信息并选择"
                    class="select"
                    @keyup.enter.native="clickSelectSonglist"
                    v-on:change="clickSelectSonglist"
                    v-on:input="clickSelectSonglist"/>
        </el-form-item>
        <el-form-item label="类型">
          <el-select v-model="form.stIds" multiple placeholder="请选择">
            <el-option
              v-for="item in songTypeList"
              :key="item.stId"
              :label="item.stName"
              :value="item.stId"
              :disabled="item.status == 1"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="时长" prop="duration" class="item-magin">
          <el-input-number style="width: 120px;float: left"
                           v-model="min"
                           placeholder="分"
                           :max="60"
                           controls-position=right>
          </el-input-number>
          <span style="float: left;margin-left: 5px;margin-right: 5px;">分</span>
          <el-input-number style="width: 120px;float: left"
                           v-model="ss"
                           placeholder="秒"
                           :precision='2'
                           :max="60"
                           controls-position=right>
          </el-input-number>
          <span style="float: left;margin-left: 5px;margin-right: 5px;">秒</span>
        </el-form-item>
        <el-form-item label="发行时间" prop="issuingDate" class="item-magin">
          <el-date-picker clearable size="small" style="width: 200px"
                          v-model="form.issuingDate"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="选择发行时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="mv" prop="mv">
          <el-upload ref="mv" :file-list="mvfileList" :action="mvfileListAction" :on-success="mvUploadSuccess">
            <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item label="收费" prop="isCharge" class="item-magin">
          <el-radio-group v-model="form.isCharge" size="medium">
            <el-radio v-for="(item, index) in radioValue" :key="index" :label="item.value"
                      :disabled="item.disabled">{{item.label}}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="版权" prop="isCopyright" class="item-magin">
          <el-radio-group v-model="form.isCopyright" size="medium">
            <el-radio v-for="(item, index) in radioValue" :key="index" :label="item.value"
                      :disabled="item.disabled">{{item.label}}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="标准音质" prop="standardUrl" class="item-magin">
          <el-upload ref="hqUrl"
                     :file-list="standardUrlList"
                     :limit="1"
                     :action="mvfileListAction" :on-success="standardUrlUploadSuccess">
            <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item label="高品质" prop="hqUrl" class="item-magin">
          <el-upload ref="hqUrl"
                     :file-list="hqUrlList"
                     :limit="1"
                     :action="mvfileListAction" :on-success="hqUrlUploadSuccess">
            <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item label="无损" prop="sqUrl" class="item-magin">
          <el-upload ref="sqUrl"
                     :file-list="sqUrlList"
                     :limit="1"
                     :action="mvfileListAction" :on-success="sqUrlUploadSuccess">
            <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
          </el-upload>
        </el-form-item>
        <el-form-item label="歌词" prop="lyrId" class="item-magin">
          <el-upload ref="lyrId" :file-list="lyrfileList" :action="mvfileListAction" :on-success="lyrUploadSuccess">
            <el-button size="small" type="primary" icon="el-icon-upload">点击上传</el-button>
          </el-upload>
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
    listSong,
    getSong,
    delSong,
    addSong,
    updateSong,
    exportSong,
    selectSingerKey,
    searchSonglistKey
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
          isCopyright: null,
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
      /** 新增按钮操作 */
      handleAdd() {
        this.reset()
        this.field101fileList = []
        this.standardUrlList = []
        this.open = true
        this.title = '添加歌曲'
        listSongtype({}).then(response => {
          this.songTypeList = response.rows
        })
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset()
        const songId = row.songId || this.ids
        getSong(songId).then(response => {
          this.form = response.data
          this.field101fileList = [{ name: '', url: this.baseUrl + this.form.coverPicture }]
          this.standardUrlList = [{ name: this.form.standardUrl, url: this.baseUrl + this.form.standardUrl }]
          this.hqUrlList = [{ name: this.form.hqUrl, url: this.baseUrl + this.form.hqUrl }]
          this.sqUrlList = [{ name: this.form.sqUrl, url: this.baseUrl + this.form.sqUrl }]
          this.lyrfileList = [{ name: this.form.lyrUrl, url: this.baseUrl + this.form.lyrUrl }]
          this.singers = this.form.singerList
          this.form.sinIds = this.form.sinIds
          this.form.stIds = this.form.stIds
          this.songTypeList = this.form.songTypeList
          this.songlistkey = this.form.songlistes.slName
          this.min = parseInt(this.form.duration/60);
          this.ss = parseInt(this.form.duration%60);
          this.open = true
          this.title = '修改歌曲'
        })
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs['form'].validate(valid => {
          if (valid) {
            if (this.form.songId != null) {
              updateSong(this.form).then(response => {
                if (response.code === 200) {
                  this.msgSuccess('修改成功')
                  this.open = false
                  this.getList()
                }
              })
            } else {
              this.form.duration = this.min*60+this.ss;
              if(this.form.standardUrl!=''){
                this.form.timbreType =1;
              }
              if(this.form.hqUrl!=''){
                this.form.timbreType =2;
              }
              if(this.form.sqUrl!=''){
                this.form.timbreType =3;
              }
              this.form.witPreUrl = ''
              for(var i = 0;i < this.singers.length;i++) {
                this.form.witPreUrl+=this.singers[i].sinId+",";
              }
              addSong(this.form).then(response => {
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
        const songIds = row.songId || this.ids
        this.$confirm('是否确认删除歌曲编号为"' + songIds + '"的数据项?', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(function() {
          return delSong(songIds)
        }).then(() => {
          this.getList()
          this.msgSuccess('删除成功')
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
