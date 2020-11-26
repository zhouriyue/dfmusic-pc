<template>
  <div>
    <div v-if="showType==true">
      <div class="app-container">
        <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
          <el-form-item label="关注数" prop="followerNumber">
            <el-input
              v-model="queryParams.followerNumber"
              placeholder="请输入关注数"
              clearable
              size="small"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item>
            <el-button type="cyan" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-form>

        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              type="primary"
              icon="el-icon-plus"
              size="mini"
              @click="handleAdd"
              v-hasPermi="['business:singer:add']"
            >新增</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="success"
              icon="el-icon-edit"
              size="mini"
              :disabled="single"
              @click="handleUpdate"
              v-hasPermi="['business:singer:edit']"
            >修改</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              icon="el-icon-delete"
              size="mini"
              :disabled="multiple"
              @click="handleDelete"
              v-hasPermi="['business:singer:remove']"
            >删除</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="warning"
              icon="el-icon-download"
              size="mini"
              @click="handleExport"
              v-hasPermi="['business:singer:export']"
            >导出</el-button>
          </el-col>
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
          <div class="change-bar-1">
            <div class="top-right-btn">
              <el-row>
                <el-tooltip class="item" effect="dark" :content="showType ? '切换到数据列表' : '切换到一览表'" placement="top">
                  <el-button size="mini" circle icon="el-icon-sort" @click="changeShowType()" />
                </el-tooltip>
              </el-row>
            </div>
          </div>
        </el-row>

        <el-table v-loading="loading" :data="singerList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" align="center" />
          <el-table-column label="歌手名" align="center" prop="sinName" />
          <el-table-column label="头像" width="80" align="center" prop="picture">
            <template slot-scope="scope">
              <img :src="baseUrl+scope.row.picture" alt="" style="width:60px;height:60px;">
            </template>
          </el-table-column>
          <el-table-column label="歌手昵称" align="center" prop="nickname" />
          <el-table-column label="性别" align="center" prop="sex" >
            <template slot-scope="scope">
              <div v-if="scope.row.sex==1">
                <img :src="manImg" style="width: 20px;height: 20px;">
              </div>
              <div v-if="scope.row.sex==2">
                <img :src="womanImg" style="width: 20px;height: 20px;">
              </div>
            </template>
          </el-table-column>
          <el-table-column label="年龄" align="center" prop="year">
            <template slot-scope="scope">
              <span class="text-item">{{scope.row.year}}岁</span>
            </template>
          </el-table-column>
          <el-table-column label="歌手类型" align="center" prop="sinType" >
          </el-table-column>
          <el-table-column label="住址" align="center" prop="area" />
          <el-table-column label="歌曲" width="50" align="center" prop="songNumber">
            <template slot-scope="scope">
              <span class="text-item">{{scope.row.songNumber}}首</span>
            </template>
          </el-table-column>
          <el-table-column label="关注" width="50" align="center" prop="followerNumber">
            <template slot-scope="scope">
              <span class="text-item">{{scope.row.followerNumber}}首</span>
            </template>
          </el-table-column>
          <el-table-column label="专辑" width="50" align="center" prop="albumNumber">
            <template slot-scope="scope">
              <span class="text-item">{{scope.row.albumNumber}}首</span>
            </template>
          </el-table-column>
          <el-table-column label="mv" width="50" align="center" prop="mvNumber">
            <template slot-scope="scope">
              <span class="text-item">{{scope.row.mvNumber}}首</span>
            </template>
          </el-table-column>
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleUpdate(scope.row)"
                v-hasPermi="['business:singer:edit']"
              >修改</el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['business:singer:remove']"
              >删除</el-button>
            </template>
          </el-table-column>
        </el-table>

        <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />

        <!-- 添加或修改歌手信息对话框 -->
        <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
          <el-form ref="elForm" :model="form" :rules="rules" size="medium" label-width="80px">
            <el-form-item label="头像" prop="field101">
              <el-upload ref="field101"
                         :limit="1"
                         :file-list="pictureList"
                         :action="pictureAction"
                         :on-success="handleSuccess"
                         list-type="picture-card">
                <i class="el-icon-plus"></i>
              </el-upload>
              <span id="upMess"></span>
            </el-form-item>
          </el-form>
          <el-form ref="form" :model="form" :rules="rules" label-width="80px">
            <el-form-item class="item-magin" label="歌手名" prop="sinName" required>
              <el-input v-model="form.sinName" placeholder="请输入歌手名" />
            </el-form-item>
            <el-form-item class="item-magin" label="歌手昵称" prop="nickname" required>
              <el-input v-model="form.nickname" placeholder="请输入歌手昵称" />
            </el-form-item>
            <el-form-item class="item-magin" label="性别" prop="sex" required>
              <el-select v-model="form.sex" placeholder="请选择性别">
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </el-form-item>
            <el-form-item class="item-magin" label="年龄" prop="year" required>
              <el-input v-model="form.year" placeholder="请输入年龄" />
            </el-form-item>
            <el-form-item class="item-magin" label="住址" prop="area" required>
              <el-input v-model="form.area" type="textarea" placeholder="请输入住址"
                        :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
            </el-form-item>
            <el-form-item class="item-magin" label="详情" prop="detail" required>
              <el-input v-model="form.detail" type="textarea" placeholder="请输入详情"
                        :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
            </el-form-item>
            <el-form-item class="item-magin" label="影响力" prop="influencePower" required>
              <el-input v-model="form.influencePower" type="textarea" placeholder="请输入影响力"
                        :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
            </el-form-item>
            <el-form-item class="item-magin" label="早期经历" prop="earlyExp" required>
              <el-input v-model="form.earlyExp" type="textarea" placeholder="请输入早期经历"
                        :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
            </el-form-item>
            <el-form-item class="item-magin" label="演绎经历" prop="performingExp" required>
              <el-input v-model="form.performingExp" type="textarea" placeholder="请输入演绎经历"
                        :autosize="{minRows: 4, maxRows: 4}" :style="{width: '100%'}"></el-input>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitForm">确 定</el-button>
            <el-button @click="cancel">取 消</el-button>
          </div>
        </el-dialog>
      </div>
    </div>
    <div v-if="showType==false">
      <div class="dashboard-editor-container">
        <div class="change-bar-2">
          <div class="top-right-btn">
            <el-row>
              <el-tooltip class="item" effect="dark" :content="showType ? '切换到数据列表' : '切换到一览表'" placement="top">
                <el-button size="mini" circle icon="el-icon-sort" @click="changeShowType()" />
              </el-tooltip>
            </el-row>
          </div>
        </div>
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
    </div>
  </div>

</template>

<script>
import { listSinger, getSinger, delSinger, addSinger, updateSinger, exportSinger,selectRankAll,
  selectFristPySinName} from "@/api/business/singer";
import manImg from "@/assets/icons/man.png";
import womanImg from "@/assets/icons/woman.png";
import iconLine from '@/assets/icons/icon-line.png'

export default {
  name: "Singer",
  data() {
    return {
      showType: true,
      zm: [],
      baseUrl: 'http://47.114.190.44',
      iconLine: iconLine,
      singerList: [],
      pictureList:[],
      pictureAction: 'http://127.0.0.1:8080/fdfs/upload',
      baseUrl: 'http://47.114.190.44',
      manImg:manImg,
      womanImg:womanImg,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 歌手信息表格数据
      singerList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sinId: null,
        sinName: null,
        nickname: null,
        sex: null,
        year: null,
        sinType: null,
        followerNumber: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList()
    for (var i = 0; i < 26; i++) {
      this.zm.push({ id: String.fromCharCode(65 + i) })
    }
  },
  methods: {
    /** 查询歌手信息列表 */
    getList() {
      this.loading = true;
      listSinger(this.queryParams).then(response => {
        this.singerList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    handleSuccess(response, file, fileList) {
      this.form.picture = response
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        sinId: null,
        sinName: null,
        nickname: null,
        sex: null,
        year: null,
        sinType: null,
        area: null,
        songNumber: null,
        followerNumber: null,
        albumNumber: null,
        mvNumber: null,
        detail: null,
        influencePower: null,
        certInfo: null,
        earlyExp: null,
        performingExp: null,
        delFlag: null,
        createTime: null,
        updateTime: null,
        delTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.sinId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.pictureList = []
      this.open = true;
      this.title = "添加歌手信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const sinId = row.sinId || this.ids
      getSinger(sinId).then(response => {
        this.form = response.data;
        this.pictureList = [{name:this.form.picture,url:this.baseUrl+this.form.picture}]
        this.open = true;
        this.title = "修改歌手信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.sinId != null) {
            updateSinger(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addSinger(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              }
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const sinIds = row.sinId || this.ids;
      this.$confirm('是否确认删除歌手信息编号为"' + sinIds + '"的数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return delSinger(sinIds);
        }).then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        }).catch(function() {});
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm('是否确认导出所有歌手信息数据项?', "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }).then(function() {
          return exportSinger(queryParams);
        }).then(response => {
          this.download(response.msg);
        }).catch(function() {});
    },
    changeShowType(){
      if(this.showType){
        selectRankAll(this.queryParams).then(response => {
          this.singerList = response.rows
        })
        this.showType = false;
      } else {
        this.showType = true;
      }
    },
    getFristPySinName(fristPy) {
      selectFristPySinName({ fristPy: fristPy }).then(response => {
        this.singerList = response.rows
      })
    }
  }
};
</script>
<style lang="scss" scoped>
  .top-right-btn {
    position: relative;
    float: right;
    margin-right: 10px;
  }
  .text-item{
    color: #707070;
    font-size: 12px;
  }
  .item-magin{
    margin-right: 30px
  }
  /* 一览表css */
  .change-bar-2{
    position: absolute;
    right: 5px;
    top: 5px;
  }
  .change-bar-1{
  }
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
