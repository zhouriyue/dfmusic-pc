<template>
  <div :class="className" :style="{height:height,width:width}">
    <div class="main">
      <div>
        <div class="title">
          <router-link :to="{path:'/singer/singer-all'}" class="link-type">
          <div>
            <span>歌手人气榜</span>
            <span><Img style="position: relative;top: 4px;" :src="arrowRight" width="18px" height="18px"/></span>
          </div>
          </router-link>
        </div>

      </div>
      <!--列表显示-->
      <!--前三名-->
      <div class="top-singer" v-for="(singer,index) in topThreeList">
        <div>
          <router-link :to="{path:'/singer/singer-main',query:{sinId:singer.sinId}}" class="link-type">
          <div class="top-postion">
            <span>{{index+1}}</span>
          </div>
          <div class="top-singer-box" v-if="index%2==0">
            <div class="singer-mess">
              <div class="singer-name">{{singer.sinName}}</div>
              <div class="top-humanQi">
              <span>
                热度：{{singer.humanQi}}
                <span v-if="singer.curRank>=singer.lastRank">
                  <Img :src="riseIcon" style="width: 18px;height: 18px;float: right;"/>
                </span>
                <span v-if="singer.curRank<singer.lastRank">
                  <Img :src="dropIcon" style="width: 18px;height: 18px;float: right;"/>
                </span>
              </span>
              </div>
            </div>
            <div style="float: right">
              <Img :src="baseUrl+singer.picture" alt="" style="width: 75px;height: 75px;border-radius: 5px;margin: 2px;"/>
            </div>
          </div>
          <div class="top-singer-box-w" v-if="index%2!=0">
            <div class="singer-mess">
              <div class="singer-name">{{singer.sinName}}</div>
              <div class="top-humanQi">
              <span>
                热度：{{singer.humanQi}}
                <span v-if="singer.curRank>=singer.lastRank">
                  <Img :src="riseIcon" style="width: 18px;height: 18px;float: right;"/>
                </span>
                <span v-if="singer.curRank<singer.lastRank">
                  <Img :src="dropIcon" style="width: 18px;height: 18px;float: right;"/>
                </span>
              </span>
              </div>
            </div>
            <div style="float: right">
              <Img :src="baseUrl+singer.picture" alt="" style="width: 75px;height: 75px;border-radius: 5px;margin: 2px;"/>
            </div>
          </div>
          </router-link>
        </div>

      </div>

      <div v-for="(singer,index) in notTopThreeList">
        <router-link :to="{path:'/singer/singer-main',query:{sinId:singer.sinId}}" class="link-type">
        <div class="singer-item" v-if="index%2==0">
          <div class="data-float position">
            {{index+4}}
          </div>
          <div class="data-float">
            <Img :src="baseUrl+singer.picture" class="singer-picture"/>
          </div>
          <div class="data-float">
            {{singer.sinName}}
          </div>
          <div class="singer-humanQi" v-if="singer.curRank>=singer.lastRank">
            <img :src="riseIcon" alt="" class="singer-icon">
          </div>
          <div class="singer-humanQi" v-if="singer.curRank<singer.lastRank">
            <img :src="dropIcon" alt="" class="singer-icon">
          </div>
          <div class="singer-humanQi">
            人气：{{singer.humanQi}}
          </div>
        </div>
        <div class="singer-item-w" v-if="index%2!=0">
          <div class="data-float position">
            {{index+4}}
          </div>
          <div class="data-float">
            <Img :src="baseUrl+singer.picture" class="singer-picture"/>
          </div>
          <div class="data-float">
            {{singer.sinName}}
          </div>
          <div class="singer-humanQi" v-if="singer.curRank>=singer.lastRank">
            <img :src="riseIcon" alt="" class="singer-icon">
          </div>
          <div class="singer-humanQi" v-if="singer.curRank<singer.lastRank">
            <img :src="dropIcon" alt="" class="singer-icon">
          </div>
          <div class="singer-humanQi">
            人气：{{singer.humanQi}}
          </div>
        </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
  import {
    selectSingerRank
  } from '@/api/business/singer'
  import resize from './mixins/resize'
  import dropIcon from '@/assets/icons/icon_drop.png'
  import riseIcon from '@/assets/icons/icon_rise.png'
  import arrowRight from '@/assets/icons/arrow_right.png'

  export default {
    mixins: [resize],
    props: {
      className: {
        type: String,
        default: 'singer'
      },
      width: {
        type: String,
        default: '100%'
      },
      height: {
        type: String,
        default: '860px'
      }
    },
    data() {
      return {
        baseUrl:'http://47.114.190.44',
        topThreeList: [],
        notTopThreeList: [],
        singerList: [],
        dropIcon: dropIcon,
        riseIcon: riseIcon,
        arrowRight: arrowRight
      }
    },
    created() {
      this.getList()
    },
    beforeDestroy() {
    },
    methods: {
      getList() {
        this.loading = true
        selectSingerRank(this.queryParams).then(response => {
          this.singerList = response.rows
          this.topThreeList = this.singerList.slice(0, 3)
          this.notTopThreeList = this.singerList.slice(3, this.singerList.length)
        })
      },
    }
  }
</script>
<style>
  .top-humanQi {
    margin-top: 10px;
    font-size: 12px;
    color: #707070;
  }

  .singer-name {
    font-size: 16px;
    color: #ff7c49;
  }

  .singer-mess {
    float: left;
    margin: 20px;
  }

  .top-postion {
    float: left;
    font-size: 25px;
    color: #ff7a57;
    margin: 5px;
  }

  .top-singer-box-w{
    width: 100%;
    height: 78px;
    background-color: #FcFcFc;
    clip-path: polygon(42px 0, 100% 0, 100% 100%, 0 100%, 0 42px);
  }

  .top-singer-box-w:hover{
    background-color: #F0F0F0;
  }

  .top-singer-box {
    width: 100%;
    height: 78px;
    background-color: #F9F9F9;
    clip-path: polygon(42px 0, 100% 0, 100% 100%, 0 100%, 0 42px);
  }
  .top-singer-box:hover{
    background-color: #F0F0F0;
  }

  .top-singer {
    width: 100%;
    height: 78px;
    margin-top: 10px;
    border-radius: 5px;
  }

  .singer-item {
    font-size: 12px;
    color: #707070;
    width: 100%;
    height: 58px;
    margin-top: 10px;
    padding: 5px 0px;
    border-radius: 5px;
    background-color: #F9F9F9;
  }

  .singer-item-w {
    font-size: 12px;
    color: #707070;
    width: 100%;
    height: 58px;
    margin-top: 10px;
    padding: 5px 0px;
    border-radius: 5px;
    background-color: #FcFcFc;
  }

  .singer-item-w:hover{
    background-color: #F0F0F0;
  }

  .singer-item:hover{
    background-color: #F0F0F0;
  }

  .singer-picture {
    border-radius: 5px;
    width: 48px;
    height: 48px;
  }

  .data-float {
    float: left;
    height: 48px;
    line-height: 48px;
    margin: auto 10px;
  }

  .position {
    font-size: 15px;
    width: 25px;
  }

  .singer-humanQi {
    float: right;
    line-height: 48px;
    margin-right: 10px;
  }

  .singer-icon {
    width: 20px;
    height: 20px;
    margin: 14px;
  }

  .title {
    color: #707070;
    font-size: 14px;
  }

  .title:hover{
    color: #7977fc;
  }

  .main {
    font-family: "Microsoft YaHei";
  }
</style>
