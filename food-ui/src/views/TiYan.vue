<template>
  <div v-if="data">
    <div class="center-nei" v-if="data.data.length==0">
      <p>暂无相关信息</p>
    </div>
    <div class="center-nei" v-else>
      <p>{{data.data[0].introduce}}
      </p>
      <h3>选购技巧</h3>
      <p>{{data.data[0].skill}}</p>
    </div>
  </div>
</template>

<script>
  export default {
    props:["sc"],
    data() {
      return {
        data: ""
      }
    },
    mounted(){
      console.log(this.sc)
      let url=`http://8.136.145.197:3000/ingredient/jqname?iname=${this.sc}`
      this.axios.get(url).then(res=>{
        this.data=res.data
        console.log(this.data)
      })
    }
  }
</script>

<style scoped>
.center-nei {
  width: 640px;
  margin-top: 15px;
  
  
}
.center-nei p{
  font-size: 18px;
}
.center-nei h3{
  font-size: 20px;
  font-weight:800;
  margin: 15px 0 10px;
}
</style>