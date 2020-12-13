<template>
  <div class="dashboard-editor-container">
    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper">
          <el-row :gutter="32">
            <el-col :xs="24" :sm="24" :lg="4">
              <div class="songlist-url-box">
                <Img style="width:180px;height:180px;position: absolute;left: 20px;" :src="diban"/>
                <Img
                  style="width:160px;height:160px;margin:10px;position: absolute;left: 25px;opacity:0.4;filter:alpha(opacity=40);"
                  :src="baseUrl+songlist.coverPicture"/>
                <Img style="width:180px;height:180px;position: absolute;" :src="baseUrl+songlist.coverPicture"/>
              </div>
            </el-col>
            <el-col :xs="24" :sm="24" :lg="20">
              <div style="margin-left: 15px;">
                <div style="margin-top: 10px;">
                  <span class="album-button">歌单</span>
                  <span style="font-size: 18px;color: #313131;font-weight: bold;margin-left: 5px;">{{songlist.slName}}</span>
                </div>
                <div style="margin-top: 15px;">
                  <Img :src="baseUrl+sysUser.avatar" style="width: 30px;height: 30px;border-radius: 25px;"/>
                  <span style="position:relative;top: -12px;font-size: 14px;margin-left: 15px;color: #707070;">{{sysUser.nickName}}</span>
                  <span style="position:relative;top: -12px;font-size: 13px;margin-left: 15px;color: #707070;">{{songlist.createTime}}创建</span>
                </div>
                <div style="margin-top: 5px;">
                  <span style="font-size: 13px;color: #707070;">歌曲：{{songlist.songNumber}}</span>
                  <span style="font-size: 13px;margin-left: 15px;color: #707070;">播放：{{songlist.playNumber}}</span>
                </div>
                <div style="margin-top: 5px;">
                  <div style="font-size: 13px;color: #707070;">简介</div>
                  <div style="font-size: 13px;margin-top: 5px;color: #707070;">{{songlist.detail}}</div>
                </div>
              </div>
            </el-col>
          </el-row>
          <el-row :gutter="32">
            <el-col :xs="24" :sm="24" :lg="24">
              <div class="song-list">
                <div class="song-tag-title">
                  <el-row :gutter="32">
                    <el-col :xs="24" :sm="24" :lg="3">
                      <span>序号</span>
                    </el-col>
                    <el-col :xs="24" :sm="24" :lg="12">
                      <span>音乐标题</span>
                    </el-col>
                    <el-col :xs="24" :sm="24" :lg="3">
                      <span>歌手</span>
                    </el-col>
                    <el-col :xs="24" :sm="24" :lg="3">
                      <span>专辑</span>
                    </el-col>
                    <el-col :xs="24" :sm="24" :lg="3">
                      <span>时长</span>
                    </el-col>
                  </el-row>
                </div>
                <div v-for="(song,index) in songList">
                  <div class="song-itme" v-if="index%2==0">
                    <el-row :gutter="32">
                      <el-col :xs="24" :sm="24" :lg="3">
                        <span>{{index+1}}</span>
                      </el-col>
                      <el-col :xs="24" :sm="24" :lg="12">
                        <span>{{song.songName}}</span>
                      </el-col>
                      <el-col :xs="24" :sm="24" :lg="3">
                        <span v-for="(item,index) in song.singerList">
                          {{item.sinName}}
                        </span>
                      </el-col>
                      <el-col :xs="24" :sm="24" :lg="3">
                        <span>{{song.songlistes.slName}}</span>
                      </el-col>
                      <el-col :xs="24" :sm="24" :lg="3">
                        <span>{{song.duration}}</span>
                      </el-col>
                    </el-row>
                  </div>
                  <div class="song-itme-w" v-if="index%2!=0">
                    <el-row :gutter="32">
                      <el-col :xs="24" :sm="24" :lg="3">
                        <span>{{index+1}}</span>
                      </el-col>
                      <el-col :xs="24" :sm="24" :lg="12">
                        <span>{{song.songName}}</span>
                      </el-col>
                      <el-col :xs="24" :sm="24" :lg="3">
                        <span>{{song.singerList[0].sinName}}</span>
                      </el-col>
                      <el-col :xs="24" :sm="24" :lg="3">
                        <span>{{song.songlistes.slName}}</span>
                      </el-col>
                      <el-col :xs="24" :sm="24" :lg="3">
                        <span>{{song.duration}}</span>
                      </el-col>
                    </el-row>
                  </div>
                </div>

              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import {
    selectSongDetail,
    selectUserSonglist
  } from '@/api/business/songlist'
  import diban from '@/assets/icons/diban.png'

  export default {
    name: 'siner-song',
    data() {
      return {
        baseUrl:'http://47.114.190.44',
        diban: diban,
        query:{},
        songlist:{},
        songList:[],
        sysUser:{}
      }
    },
    created() {
      this.songlist = this.$route.query.songlist
      this.query.slId = this.songlist.slId
      this.getList()
    },
    methods:{
      /** 查询歌单列表 */
      getList() {
        this.loading = true
        selectSongDetail(this.query).then(response => {
          this.songList = response.rows
        })
        selectUserSonglist(this.query).then(response => {
          this.sysUser = response.data
        })
      }
    }
  }
</script>

<style lang="scss" scoped>
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
  .album-button {
    border: 1px solid #ff4d4d;
    padding: 3px;
    border-radius: 5px;
    font-size: 12px;
    color: #ff4d4d;
  }

  .songlist-url-box {
    width: 180px;
    height: 180px;
    position: relative;
  }

  .dashboard-editor-container {
    padding: 32px;
    background-color: rgb(240, 242, 245);
    position: relative;
    min-height: 2000px;

    .chart-wrapper {
      background: #fff;
      padding: 32px;
      min-height: 700px;
    }
  }
</style>
