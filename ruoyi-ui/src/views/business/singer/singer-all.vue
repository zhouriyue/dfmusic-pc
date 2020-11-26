<template>
  <div class="dashboard-editor-container">

    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="24">
        <div class="chart-wrapper">
          <div class="select">
            <div class="zf">
              <span style="margin: 6px;">筛选：</span>
              <span class="zf-item" @click="getFristPySinName(null)">热门</span>
              <div class="zf-item" v-for="z in zm">
                <div @click="getFristPySinName(z.id)">
                  <Img :src="iconLine" style="width: 15px;height: 15px;margin-left: 10px;margin-right: 10px;"/>
                  <span>{{z.id}}</span>
                </div>
              </div>
            </div>
          </div>
          <div class="bar-main">
            <div class="songlist-item" v-for="(singer,index) in singerList">
              <router-link :to="{path:'/singer/singer-main',query:{sinId:singer.sinId}}" class="link-type">
                <div class="songlist-box">
                  <Img class="songlist-url" :src="baseUrl+singer.picture"/>
                  <div class="cover-h"></div>
                </div>
              </router-link>
              <div>
                <div class="sl-name">
                  {{singer.sinName}}
                </div>
              </div>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import {
    selectRankAll,
    selectFristPySinName
  } from '@/api/business/singer'
  import iconLine from '@/assets/icons/icon-line.png'

  export default {
    name: 'singer-all',
    data() {
      return {
        zm: [],
        baseUrl: 'http://47.114.190.44',
        iconLine: iconLine,
        singerList: []
      }
    },
    created() {
      this.getList()
      for (var i = 0; i < 26; i++) {
        this.zm.push({ id: String.fromCharCode(65 + i) })
      }
    },
    methods: {
      getList() {
        selectRankAll(this.queryParams).then(response => {
          this.singerList = response.rows
        })
      },
      getFristPySinName(fristPy) {
        selectFristPySinName({ fristPy: fristPy }).then(response => {
          this.singerList = response.rows
        })
      }
    }
  }
</script>

<style lang="scss" scoped>
  .zf-item {
    margin: 5px 0px;
  }

  .zf-item:hover {
    cursor: pointer;
  }

  .zf {
    display: flex;
    flex-wrap: wrap;
    font-size: 14px;
    color: #707070;
  }

  .select {
    font-size: 13px;
    color: #707070;
    margin-left: 10px;
  }

  .cover-h {
    width: 110px;
    height: 110px;
    background-color: rgba(0, 0, 0, 0);
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
  }

  .cover-h:hover {
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

  .sl-name {
    margin: 10px 0px;
    font-size: 14px;
    color: #707070;
  }

  .create-by {
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

  .songlist-url {
    width: 150px;
    height: 150px;
    border-radius: 3px;
  }

  .songlist-box {
    width: 150px;
    height: 150px;
    position: relative;
  }

  .songlist-item {
    margin: 20px 10px;
  }

  .bar-main {
    display: flex;
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
