<template>
  <div id="singer-main" class="dashboard-editor-container">

    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper">
          <el-row :gutter="32">
            <el-col :xs="24" :sm="24" :lg="4">
              <Img style="width: 180px;height: 180px;" :src="baseUrl+singer.picture"/>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="20">
              <div style="margin-top: 10px;padding-bottom: 10px;border-bottom:1px solid #f0f0f0;"><span class="main-singer-name">{{singer.sinName}}</span></div>
              <div class="sex-bx">
                <span v-if="singer.sex==1"><Img :src="manImg" style="width: 18px;height: 18px;"/></span>
                <span v-if="singer.sex==2"><Img :src="womanImg" style="width: 18px;height: 18px;"/></span>
                <span class="year-box">
                  <span style="color: #707070;font-size:12px;position: relative;margin-left:20px;top:-5px;">
                    年龄:<span>20</span>
                  </span>
                </span>
              </div>
              <div style="margin-bottom: 10px;">
                <span style="font-size: 14px;color: #707070;letter-spacing: 2px;">单曲数：{{singer.songNumber}}</span>
                <span style="font-size: 14px;color: #707070;margin-left: 20px;letter-spacing: 2px;">专辑数：{{singer.songNumber}}</span>
              </div>
              <div>
                <div style="color: #707070;font-size: 14px;margin-bottom: 5px;letter-spacing: 2px;">详情</div>
                <div style="color: #707070;font-size:13px;line-height: 30px;">{{singer.detail}}</div>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>
    </el-row>

    <!--专辑-->
    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper">
          <div class="detail-title">专辑</div>
          <div class="bar-main">
            <div class="songlist-item" v-for="(songlist,index) in songlists">
              <router-link :to="{path:'/songlist/sl-song',query:{songlist:songlist,singer:singer}}" class="link-type">
              <div class="songlist-box">
                <Img class="songlist-url" :src="baseUrl+songlist.coverPicture"/>
                <span class="create-by">{{songlist.slName}}</span>
                <div class="cover-h"></div>
              </div>
              </router-link>
              <div>
          <span class="sl-name">
            {{songlist.detail}}
          </span>
              </div>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>

    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper">
          <div class="detail-title">影响力</div>
          <div class="detail-content">
            {{singer.influencePower}}
          </div>
        </div>
      </el-col>
    </el-row>

    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper">
          <div class="detail-title">早期经历</div>
          <div class="detail-content">
            {{singer.earlyExp}}
          </div>
        </div>
      </el-col>
    </el-row>

    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper">
          <div class="detail-title">演绎经历</div>
          <div class="detail-content">
            {{singer.performingExp}}
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import {
    selectSingerDetail,
    selectSingerAlbum
  } from "@/api/business/singer";
  import manImg from "@/assets/icons/man.png";
  import womanImg from "@/assets/icons/woman.png";

  export default {
    name: 'singer-main',
    data() {
      return {
        manImg:manImg,
        womanImg:womanImg,
        baseUrl:'http://47.114.190.44',
        sinId:'',
        singer:{},
        query:{},
        songlists:[]
      }
    },
    created() {
      this.sinId = this.$route.query.sinId
      this.query.sinId = this.sinId
      this.intData()
    },
    methods: {
      intData(){
        selectSingerDetail(this.query).then(response => {
          this.singer = response.data;
        });
        selectSingerAlbum(this.query).then(response => {
          this.songlists = response.rows
        })
      },
    }
  };
</script>

<style lang="scss" scoped>
.sl-name{
  font-size: 10px;
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
.songlist-url{
  width: 110px;
  height: 110px;
  border-radius: 3px;
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
  width: 110px;
  height: 110px;
  background-color: rgba(0, 0, 0, 0.1);
  position: absolute;
  color: white;
  left: 0;
  bottom: 0;
  width: 100%;
  border-radius: 3px;
}
.songlist-box{
  width: 110px;
  height: 110px;
  position: relative;
}
.songlist-item{
  margin: 10px 10px;
}
.bar-main{
  display:flex;
  flex-wrap: wrap;
  font-family: "Microsoft YaHei";
}
.detail-content{
  font-size: 13px;
  margin-top: 15px;
  color: #707070;
  line-height: 30px;
}
.detail-title{
  font-size: 14px;
  color: #707070;
  padding-bottom: 10px;
  border-bottom:1px solid #f0f0f0;
}
.sex-bx{
  margin: 10px 0px;
}
.main-singer-name{
  color: #515151;
  font-size: 22px;
  font-weight: bold;
}
.dashboard-editor-container {
  padding: 32px;
  background-color: rgb(240, 242, 245);
  position: relative;

  .chart-wrapper {
    background: #fff;
    padding: 16px;
    margin-bottom: 32px;
  }
}
</style>
