<template>
  <div>
    {{ str }}
  </div>

</template>

<script>
export default {
  name: "Lifecycle",
  data(){
    return{
      str:'123'
    }
  },
  //生命周期函数:在某个时刻会自动执行的函数
  //1.当页面挂载的时候，前四个生命周期函数会被执行 (beforeCreate,created,beforeMount,mounted)
  //2.哪个阶段有$el和$data
  //3.加入keep-alive会多两个生命周期(activated[进入],deactivated[离开])


  //Vue组件(实例)创建完成之前就会执行
  beforeCreate(){//beforeCreate这个阶段不会挂载el和data
    console.log('beforeCreate',this.$el, this.$data)
  },


  //Vue组件(实例)创建完毕之就会执行
  created(){//created这个阶段会挂载data，不会挂载el
    console.log('created',this.$el, this.$data)
  },


  //<template>模板渲染到页面之前会执行
  beforeMount(){//created这个阶段会挂载data，不会挂载el
    console.log('beforeMount',this.$el, this.$data)
  },


  //<template>模板渲染到页面完毕之后会执行,页面上就可以看到内容了
  mounted(){//mounted这个阶段会挂载data也会挂载el
    console.log('mounted',this.$el, this.$data)
  },

  //当data数据发生改变时，但是dom内容还未发生改变
  beforeUpdate(){
    const content = document.getElementById('app').innerHTML
    console.log('beforeUpdate',content)
  },


  //当data数据发生改变时调用，dom元素发生改变
  updated(){//updated这个阶段会挂载data也会挂载el
    const content = document.getElementById('app').innerHTML
    console.log('updated',content)
  },


  //Vue应用失效时
  beforeUnmount(){
    console.log('beforeUnmount')
  },

  //Vue应用失效时,并且DOM完全移除完毕
  unmounted(){
    console.log('unmounted')
  },



  //
  beforeDestroy(){
    console.log('beforeDestroy')
  },

  //
  destroyed(){//destroyed这个阶段会挂载data也会挂载el
    console.log('destroyed')
  },

}
</script>

<style scoped>

</style>