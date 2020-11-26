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
      <el-form-item>
        <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="danger"
          size="mini"
          :disabled="multiple"
          @click="saveToSl"
          v-hasPermi="['business:song:savetosl:add']"
        ><i class="iconfont icon-tianjia"></i>收藏歌曲</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!--显示列表-->
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
      <el-table-column label="mv" align="center" prop="mvUrl">
        <template slot-scope="scope">
          <span v-if="scope.row.mvUrl==''||scope.row.mvUrl==null" style="font-size: 10px">无</span>
          <span v-if="scope.row.mvUrl==''||scope.row.mvUrl==null" style="font-size: 10px">
            {{scope.row.mvUrl}}
          </span>
        </template>
      </el-table-column>
      <el-table-column label="收费" align="center" prop="isCharge" >
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
      <el-table-column label="单曲" align="center" prop="isSingle">
        <template slot-scope="scope">
          <span v-if="scope.row.isSingle==1" style="font-size: 10px">是</span>
          <span v-if="scope.row.isSingle==0" style="font-size: 10px">否</span>
        </template>
      </el-table-column>
      <el-table-column label="歌单id" align="center" prop="slId" />
      <el-table-column label="歌词id" align="center" prop="lyrId" >
        <template slot-scope="scope">
          <span v-if="scope.row.lyrId!=null||scope.row.lyrId!=''" style="font-size: 10px">是</span>
          <span v-if="scope.row.lyrId==null||scope.row.lyrId==''" style="font-size: 10px">否</span>
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
    <el-dialog :title="title" :visible.sync="open" width="900px" append-to-body>
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
        <el-form-item>
          <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <!--列表显示-->
      <el-table v-loading="loading" :data="songlistList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center"/>
        <el-table-column label="歌单id" align="center" prop="slId"/>
        <el-table-column label="歌单名" width="120" align="center" prop="slName"/>
        <el-table-column label="歌单封面" width="80" align="center" prop="coverPicture">
          <template slot-scope="scope">
            <img :src="this.baseUrl+scope.row.coverPicture" alt="" style="width:60px;height:60px;">
          </template>
        </el-table-column>
        <el-table-column label="歌曲数" align="center" prop="songNumber"/>
        <el-table-column label="用户名" align="center" prop="userName"/>
        <el-table-column label="用户昵称" align="center" prop="nickName"/>
        <el-table-column label="详情" align="center" prop="detail" class="information-title">
          <template slot-scope="scope">
            <span style="font-size: 10px;">{{scope.row.detail}}</span>
          </template>
        </el-table-column>
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
      </el-table>
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
    selectSingerKey } from "@/api/business/song";
  import {getSonglistDetail
  } from '@/api/business/songlist'
  import fork from '@/assets/icons/icon_fork.png'
  import forkSel from '@/assets/icons/icon_fork_sel.png'
  // Font class
  import "@/assets/iconfont/iconfont.css";
  // Symbol
  import "@/assets/iconfont/iconfont.js";

  export default {
    name: "Song",
    data() {
      return {
        songlistList: [],
        //选择歌曲
        selSongIds:[],
        //标准音质列表
        standardUrlList:[],
        //超高音质列表
        hqUrlList:[],
        //超高音质列表
        sqUrlList:[],
        //无损文件列表
        witPreUrlList:[],
        //歌词文件列表
        lyrfileList:[],
        radioValue: [{
          "label": "是",
          "value": 1
        }, {
          "label": "否",
          "value": 0
        }],
        mvfileListAction:"http://127.0.0.1:8080/upload/img",
        mvfileList:[],
        fork:fork,
        forks:[fork,forkSel],
        forkSel:forkSel,
        selectSingers:[],
        singer:'',
        singers:[],
        selectkey:'',
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
        min:0,
        ss:0.0,
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
      getSongList() {
        this.loading = true
        getSonglistDetail(this.queryParams).then(response => {
          this.songlistList = response.rows
          this.total = response.total
          this.loading = false
        })
      },
      saveToSl(row){
        this.open = true;
        this.title = "添加到歌单";
        this.selSongIds = row.songId || this.ids;
        this.getSongList();
      },
      lyrUploadSuccess(response,file,fileList) {
        this.lyrUrl = response
      },
      mvUploadSuccess(response, file, fileList){
        this.form.mv = response
      },
      deleteSinger(sinId){
        for(var i = 0;i < this.selectSingers.length;i++) {
          if(this.selectSingers[i].sinId==sinId) {
            this.selectSingers.splice(i,1);
          }
        }
        ;
      },
      /** 获取查询歌手 */
      selectSinger(e){
        var that = this
        if(that.singer!='') {
          this.selectSingers.push(that.singer)
        }
      },
      clickSelectSinger(){
        var singerSelect = document.getElementById("singer_select");
        selectSingerKey({key:this.selectkey}).then(response=>{
          this.singers = response
        });
        singerSelect.click();
      },
      updateImg(id){
        this.fork = this.forks[id];
      },
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
<style>
  .img {
    width: 20px;
    height: 20px;
    position: relative;
    top:5px;
    left: 5px;
  }
  .select-singer{
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
  .select{
    position: relative;
    top: -36.78px;
  }
  .item-magin{
    margin-right: 30px
  }
</style>
