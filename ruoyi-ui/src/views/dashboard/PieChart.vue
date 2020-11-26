<template>
  <div class="main">
    <div class="title">
      <router-link :to="{path:'/ranking/ranking-all'}" class="link-type">
      <span>排行榜</span>
      <span><Img style="position: relative;top: 4px;" :src="arrowRight" width="18px" height="18px"/></span>
      </router-link>
    </div>

    <div :class="className" :style="{height:height,width:width}">
      <div class="rank-item" v-for="(rankinglist,index) in rankinglists.slice(0,4)">
        <router-link :to="{path:'/ranking/ranking-song',query:{rankinglist:rankinglist}}" class="link-type">
        <div class="data-mess">
          <Img class="rank-url" :src="baseUrl+rankinglist.slPicture" alt=""/>
          <div class="bj"></div>
        </div>
        <div class="song-box">
          <div v-for="(song,index) in rankinglist.songList.slice(0,5)">
            <div class="song-item" v-if="index%2==0">
              <span class="song-position">{{index+1}}</span>
              <span class="song-name">{{song.songName}}</span>
              <span class="singer-box" v-for="(singer,index) in song.singerList">
                <span>{{singer.sinName}}<span v-if="index>0">/</span></span>
              </span>
            </div>
            <div class="song-item-w" v-if="index%2!=0">
              <span class="song-position">{{index+1}}</span>
              <span class="song-name">{{song.songName}}</span>
              <span class="singer-box" v-for="(singer,index) in song.singerList">
                <span>{{singer.sinName}}<span v-if="index>0">/</span></span>
              </span>
            </div>
          </div>
          <div>
            <span style="color: #707070;font-size: 11px;">查看全部
              <Img :src="arrowRight" style="width: 18px;height: 18px;position: relative;top:4px;left: -6px;"/></span>
          </div>
        </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
  require('echarts/theme/macarons') // echarts theme
  import resize from './mixins/resize'
  import arrowRight from '@/assets/icons/arrow_right.png'
  import { getOffRankingList} from "@/api/business/rankinglist";

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
        default: '810px'
      }
    },
    data() {
      return {
        baseUrl:'http://47.114.190.44',
        arrowRight: arrowRight,
        rankinglists:[]
      }
    },
    created() {
      this.getList()
      this.singer.sinId = this.$route.query.sinId
    },
    methods: {
      /** 查询排行榜管理列表 */
      getList() {
        getOffRankingList().then(response => {
          this.rankinglists = response.rows;
        });
      },
    }
  }
</script>
<style>

  .song-name {
    margin-left: 10px;
    font-size: 12px;
    color: #515151;
    text-align: center;
  }

  .song-position {
    font-size: 14px;
    color: #ff7c49;
  }

  .song-item:hover {
    background-color: #f0f0f0;
  }

  .song-item-w:hover {
    background-color: #f0f0f0;
  }

  .song-item {
    width: 100%;
    border-radius: 3px;
    padding: 6px 10px;
    background-color: #f8f8f8;
  }

  .song-item-w {
    width: 100%;
    border-radius: 3px;
    padding: 7.5px 10px;
    background-color: #ffffff;
  }

  .song-box {
    overflow: hidden;
    height: 180px;
  }

  .singer-box {
    float: right;
    margin-top: 3px;
    font-size: 8px;
    color: #999999;
  }

  .bj{
    width: 160px;
    height: 160px;
  }

  .data-mess {
    width: 160px;
    height: 160px;
    margin-right: 5px;
    float: left;
  }

  .data-mess:hover{
    background-color: rgba(0, 0, 0, 0.2);
  }

  .rank-url {
    width: 160px;
    height: 160px;
    margin-right: 10px;
    border-radius: 5px;
  }

  .rank-item {
    overflow: hidden;
    width: 100%;
    margin: 20px auto;
  }

  .title {
    color: #707070;
    font-size: 14px;
    width: 100%;
    border-bottom: 1px solid #F0F0F0;
    padding-bottom: 10px;
    margin-bottom: 20px;
  }

  .main {
    font-family: "Microsoft YaHei";
  }
</style>
