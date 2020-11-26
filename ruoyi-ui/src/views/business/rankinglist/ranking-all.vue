<template>
  <div class="dashboard-editor-container">
    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper">
          <div style="font-weight: bold;font-size: 20px;">官方榜</div>
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

          <div style="margin-top: 30px">
            <div style="font-weight: bold;font-size: 20px;margin:50px 0px 20px 0px;">全球榜</div>
            <div class="not-off">
              <div class="rank-not-item" v-for="rankingList in notOffRl">
                <router-link :to="{path:'/ranking/ranking-song',query:{rankinglist:rankingList}}" class="link-type">
                <div>
                  <Img class="rl-url" :src="baseUrl+rankingList.slPicture"/>
                  <div class="cover-h"></div>
                </div>
                <div style="font-size: 14px;color: #515151;margin-top: 5px">{{rankingList.rlName}}</div>
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import { getOffRankingList,getNotOff} from "@/api/business/rankinglist";
  import arrowRight from '@/assets/icons/arrow_right.png'
  export default {
    name: 'ranking-all',
    data(){
      return{
        baseUrl:'http://47.114.190.44',
        arrowRight: arrowRight,
        rankinglists:[],
        notOffRl:[]
      }
    },
    created() {
      this.getList()
    },
    methods:{
      /** 查询排行榜管理列表 */
      getList() {
        getOffRankingList().then(response => {
          this.rankinglists = response.rows;
        });
        getNotOff().then(response => {
          this.notOffRl = response.rows;
        });
      },
    }
  }
</script>

<style lang="scss" scoped>
  .cover-h{
    width: 200px;
    height: 200px;
    background-color: rgba(0, 0, 0, 0);
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
  }
  .cover-h:hover{
    width: 200px;
    height: 200px;
    background-color: rgba(0, 0, 0, 0.1);
    position: absolute;
    color: white;
    top: 0;
    left: 0;
    bottom: 0;
    width: 100%;
    border-radius: 5px;
  }
  .rl-url{
    width: 200px;
    height: 200px;
    border-radius: 5px;
  }
  .rank-not-item{
    margin: 10px 20px 20px 0px;
    position: relative;
  }
  .not-off{
    display: flex;
    flex-wrap: wrap;
  }
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
    margin-right: 15px;
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
