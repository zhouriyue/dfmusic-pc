<template>
  <div class="dashboard-editor-container">
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
</template>

<script>
  require('echarts/theme/macarons') // echarts theme
  import {
    getSonglistDetail
  } from '@/api/business/songlist'
  import arrowRight from '@/assets/icons/arrow_right.png'
  import play from '@/assets/icons/play.png'

  export default {
    data() {
      return {
        play:play,
        arrowRight:arrowRight,
        baseUrl:'http://47.114.190.44',
        songlists:[]
      }
    },
    created() {
      this.getList()
    },
    methods: {
      /** 查询歌单列表 */
      getList() {
        getSonglistDetail({pageNum:1,pageSize:18}).then(response => {
          this.songlists = response.rows
        })
      }
    }
  }
</script>

<style lang="scss" scoped>
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
