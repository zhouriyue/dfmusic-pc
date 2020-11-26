<template>
  <div class="dashboard-editor-container">

    <panel-group @handleSetLineChartData="handleSetLineChartData"/>

    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;">
      <div>
        <el-form class="date-select" ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
          <el-form-item class="select-itme" v-if="isDay==true" label="日期范围" prop="scopeDate">
            <el-date-picker type="daterange" v-model="formData.scopeDate" format="yyyy-MM-dd"
                            value-format="yyyy-MM-dd" :style="{width: '100%'}" start-placeholder="开始日期"
                            end-placeholder="结束日期"
                            range-separator="至" clearable></el-date-picker>
          </el-form-item>
          <el-form-item class="select-itme" v-if="isDay!=true" label="日期范围" prop="scopeDate">
            <el-date-picker type="daterange" v-model="formData.scopeDate" format="yyyy-MM"
                            value-format="yyyy-MM" :style="{width: '100%'}" start-placeholder="开始日期"
                            end-placeholder="结束日期"
                            range-separator="至" clearable></el-date-picker>
          </el-form-item>
          <el-form-item class="select-itme" label="下拉选择" prop="dateType">
            <el-select v-model="formData.dateType" placeholder="请选择下拉选择" @change="selectDateType" clearable
                       :style="{width: '100%'}">
              <el-option v-for="(item, index) in dateTypes" :key="index" :label="item.label"
                         :value="item.value" :disabled="item.disabled"></el-option>
            </el-select>
          </el-form-item>
          <el-form-item class="submit-button" size="large">
            <el-button type="primary" @click="submitForm">提交</el-button>
            <el-button @click="resetForm">重置</el-button>
          </el-form-item>
        </el-form>
      </div>
      <line-chart :chart-data="lineChartData"/>
    </el-row>

    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <raddar-chart/>
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <pie-chart/>
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <bar-chart/>
        </div>
      </el-col>
    </el-row>

    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;">
      <song-index/>
    </el-row>
  </div>
</template>

<script>
  import { getScopeOrder } from '@/api/business/order'
  import PanelGroup from './dashboard/PanelGroup'
  import LineChart from './dashboard/LineChart'
  import RaddarChart from './dashboard/RaddarChart'
  import PieChart from './dashboard/PieChart'
  import BarChart from './dashboard/BarChart'
  import SongIndex from './dashboard/SongIndex'

  const lineChartData = {
    newVisitis: {
      expectedData: [100, 120, 161, 134, 105, 160, 165],
      actualData: [120, 82, 91, 154, 162, 140, 145],
      title: ['一月', '二月', '三月', '四月', '五月', '六月', '七月'],
      lineStr: ['订单量', '成交量']
    },
    messages: {
      expectedData: [200, 192, 120, 144, 160, 130, 140],
      actualData: [180, 160, 151, 106, 145, 150, 130],
      title: ['一月', '二月', '三月', '四月', '五月', '六月', '七月'],
      lineStr: ['订单量', '成交量']
    },
    purchases: {
      expectedData: [80, 100, 121, 104, 105, 90, 100],
      actualData: [120, 90, 100, 138, 142, 130, 130],
      title: ['一月', '二月', '三月', '四月', '五月', '六月', '七月'],
      lineStr: ['订单量', '成交量']
    },
    shoppings: {
      expectedData: [130, 140, 141, 142, 145, 150, 160],
      actualData: [120, 82, 91, 154, 162, 140, 130],
      title: ['一月', '二月', '三月', '四月', '五月', '六月', '七月'],
      lineStr: ['成交量', '订单量']
    }
  }

  export default {
    name: 'Index',
    components: {
      PanelGroup,
      LineChart,
      RaddarChart,
      PieChart,
      BarChart,
      SongIndex
    },
    data() {
      return {
        isDay: true,
        lineChartData: {
          expectedData:[],
          actualData: [],
          title: [],
          lineStr: ['成交量', '订单量']
        },
        formData: {
          scopeDate: [],
          dateType: undefined
        },
        scopeOrderList: [],
        rules: {
          scopeDate: [{
            required: true,
            type: 'array',
            message: '至少选择一个日期',
            trigger: 'change'
          }],
          dateType: [{
            required: true,
            message: '请选择日期类型',
            trigger: 'change'
          }]
        },
        dateTypes: [{
          'label': '日',
          'value': 1
        }, {
          'label': '月',
          'value': 2
        }]
      }
    },
    created() {
      var date = new Date();
      var endDateStr = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate()+1
      this.getList(this.fun_date(-7),endDateStr, 1)
    },
    methods: {
      getList(startDate, endDate, dateType) {
        getScopeOrder({ startDate: startDate, endDate: endDate, dateType: dateType,orderState:1}).then(response => {
          this.scopeOrderList = response.rows
          var expectedData = [];
          var title = [];
          for (var i = 0; i < this.scopeOrderList.length; i++) {
            expectedData.push(this.scopeOrderList[i].count)
            title.push(this.scopeOrderList[i].createTime)
          }
          this.lineChartData.expectedData = expectedData
          this.lineChartData.title = title
        })
        getScopeOrder({ startDate: startDate, endDate: endDate, dateType: dateType,orderState:null}).then(response => {
          this.scopeOrderList = response.rows
          var actualData = [];
          for (var i = 0; i < this.lineChartData.title.length; i++) {
            var flag = 0;
            for(var j = 0;j < this.scopeOrderList.length;j++) {
              if(this.lineChartData.title[i] == this.scopeOrderList[j].createTime){
                actualData.push(this.scopeOrderList[j].count)
                flag = 1;
                break;
              }
            }
            if(flag==0) {
              actualData.push(0);
            }
          }
          this.lineChartData.actualData = actualData
        })
      },
      selectDateType() {
        if (this.formData.dateType == 1) {
          this.isDay = true
        } else {
          this.isDay = false
        }
      },
      handleSetLineChartData(type) {
        this.lineChartData = lineChartData[type]
        var date = new Date();
        var endDateStr = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate()+1
        this.getList(this.fun_date(-7),endDateStr, 1)
      },
      submitForm() {
        this.getList(this.formData.scopeDate[0], this.formData.scopeDate[1], this.formData.dateType)
      },
      resetForm() {
        this.$refs['elForm'].resetFields()
      },
      fun_date(d) {
        var date1 = new Date(),
          time1 = date1.getFullYear() + '-' + (date1.getMonth() + 1) + '-' + date1.getDate()//time1表示当前时间
        var date2 = new Date(date1)
        date2.setDate(date1.getDate() + d)
        var time2 = date2.getFullYear() + '-' + (date2.getMonth() + 1) + '-' + date2.getDate()
        return time2
      }
    }
  }
</script>

<style lang="scss" scoped>
  .submit-button {
    width: 20%;
    min-width: 250px;
  }

  .select-itme {
    width: 38%;
    min-width: 400px;
  }

  .date-select {
    display: flex;
    flex-wrap: wrap;
  }

  .dashboard-editor-container {
    padding: 32px;
    background-color: rgb(240, 242, 245);
    position: relative;

    .chart-wrapper {
      background: #fff;
      padding: 16px 16px 0;
      margin-bottom: 32px;
    }
  }

  @media (max-width: 1024px) {
    .chart-wrapper {
      padding: 8px;
    }
  }
</style>
