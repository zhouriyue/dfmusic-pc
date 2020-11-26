<template>
  <div :class="className" :style="{height:height,width:width}">
    <div class="title">
      <router-link :to="{path:'/songlist/songlist-all'}" class="link-type">
      <span>推荐歌单</span>
      <span><Img style="position: relative;top: 4px;" :src="arrowRight" width="18px" height="18px"/></span>
      </router-link>
    </div>
    <div class="bar-main">
      <div class="songlist-item" v-for="(songlist,index) in songlists">
        <router-link :to="{path:'/songlist/user-songlist',query:{songlist:songlist}}" class="link-type">
        <div class="songlist-box">
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
</template>

<script>
require('echarts/theme/macarons') // echarts theme
import resize from './mixins/resize'
import {
  getSonglistDetail
} from '@/api/business/songlist'
import arrowRight from '@/assets/icons/arrow_right.png'
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
      default: '860px'
    }
  },
  data() {
    return {
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
    width: 88px;
    height: 88px;
    border-radius: 3px;
  }
  .songlist-box{
    width: 88px;
    height: 88px;
    position: relative;
  }
  .songlist-item:hover{
    border-radius: 3px;
    background-color: #f0f0f0;
  }
  .songlist-item{
    margin: 10px 5px;
  }
  .bar-main{
    display:flex;
    flex-wrap: wrap;
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
    color: #7977fc;
  }
</style>
