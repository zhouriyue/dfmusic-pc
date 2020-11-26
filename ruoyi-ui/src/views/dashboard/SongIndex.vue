<template>
  <div :class="className" :style="{height:height,width:width}">
    <div class="title">
        <span>歌曲</span>
        <span><Img style="position: relative;top: 4px;" :src="arrowRight" width="18px" height="18px"/></span>
    </div>
    <div class="song-type-box">
      <div class="type-item" @click="selectType(null)">
        <span style="margin-left:10px;margin-right:10px;position: relative;top: 3px;">全部</span>
      </div>
      <div class="type-item" v-for="songtype in songtypeList">
        <div @click="selectType(songtype.stId)">
          <Img :src="iconLine" style="width: 15px;height: 15px;"/>
          <span style="margin-left:10px;margin-right:10px;">{{songtype.stName}}</span>
        </div>
      </div>
    </div>
    <div class="bar-main">
      <div v-for="(song,index) in songList">
        <div class="song-itme" v-if="index%2==0">
          <el-row :gutter="32">
            <el-col :xs="24" :sm="24" :lg="1">
              <span class="font-center">{{index+1}}</span>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="5">
              <span><Img :src="baseUrl+song.coverPicture" style="width: 50px;height: 50px;border-radius: 5px;"/></span>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="9">
              <span class="font-center">{{song.songName}}</span>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="3">
              <span class="font-center">{{song.singerList[0].sinName}}</span>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="3">
              <span class="font-center">{{song.songlistes.slName}}</span>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="3">
              <span class="font-center">{{song.duration}}</span>
            </el-col>
          </el-row>
        </div>
        <div class="song-itme-w" v-if="index%2!=0">
          <el-row :gutter="32">
            <el-col :xs="24" :sm="24" :lg="1">
              <span class="font-center">{{index+1}}</span>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="5">
              <span><Img :src="baseUrl+song.coverPicture" style="width: 50px;height: 50px;border-radius: 5px;"/></span>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="9">
              <span class="font-center">{{song.songName}}</span>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="3">
              <span class="font-center">{{song.singerList[0].sinName}}</span>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="3">
              <span class="font-center">{{song.songlistes.slName}}</span>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="3">
              <span class="font-center">{{song.duration}}</span>
            </el-col>
          </el-row>
        </div>
    </div>
      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="selectTypeSong"
      />
    </div>
  </div>
</template>

<script>
  import { listSongtype,getTypeSong} from "@/api/business/songtype";
  require('echarts/theme/macarons') // echarts theme
  import resize from './mixins/resize'
  import {
    getSonglistDetail
  } from '@/api/business/songlist'
  import arrowRight from '@/assets/icons/arrow_right.png'
  import iconLine from '@/assets/icons/icon-line.png'
  const animationDuration = 6000

  export default {
    mixins: [resize],
    props: {
      className: {
        type: String,
        default: 'chart'
      },
      width: {
        type: String,
        default: '100%'
      },
      height: {
        type: String,
        default: '900px'
      }
    },
    data() {
      return {
        iconLine:iconLine,
        arrowRight:arrowRight,
        baseUrl:'http://47.114.190.44',
        songList:[],
        // 歌曲类型表格数据
        songtypeList: [],
        // 总条数
        total: 0,
        queryParams: {
          stId:0,
          pageNum: 1,
          pageSize: 10,
        }
      }
    },
    created() {
      this.getList()
      this.selectTypeSong(null)
    },
    methods: {
      /** 查询歌单列表 */
      getList() {
        listSongtype().then(response => {
          this.songtypeList = response.rows;
        });
      },
      selectTypeSong() {
        getTypeSong(this.queryParams).then(response => {
          this.songList = response.rows;
          this.total = response.total
        });
      },
      selectType(stId){
        this.queryParams.stId = stId
        this.selectTypeSong()
      }
    }
  }
</script>
<style lang="scss" scoped>
  .font-center{
    line-height: 50px;
  }
  .song-itme span{
    margin-left: 10px;
  }
  .song-itme-w span{
    margin-left: 10px;
  }
  .song-tag-title span{
    margin-left: 10px;
  }
  .song-tag-title{
    margin-top: 10px;
    margin-bottom: 10px;
    padding: 0px 10px;
  }
  .song-itme-w{
    padding: 10px 10px;
    background-color: #ffffff;
  }
  .song-itme-w:hover{
    background-color: #f0f0f0;
  }
  .song-itme{
    padding: 10px 10px;
    background-color: #f9f9f9;
  }
  .song-itme:hover{
    background-color: #f0f0f0;
  }
  .song-list{
    margin-top: 30px;
    padding: 32px 0px;
    color: #707070;
    font-size: 14px;
  }
  .type-item{
    font-size: 12px;
  }
  .type-item:hover{
    cursor: pointer;
    color: #00afff;
  }
  .song-type-box{
    cursor:hand;
    display:flex;
    flex-wrap: wrap;
    font-size: 14px;
    color: #707070;
  }
  .bar-main{
    margin-top: 20px;
    font-size: 12px;
    color: #707070;
    font-family: "Microsoft YaHei";
  }
  .title {
    color: #707070;
    font-size: 14px;
    width: 100%;
    border-bottom: 1px solid #F0F0F0;
    padding-bottom: 10px;
    margin-bottom: 20px;
  }
  .title:hover{
    cursor: pointer;
    color: #7977fc;
  }
</style>
