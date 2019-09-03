const book={
     //初始值
    state: {
        fileName:"",
        menuVisible:false
      },
      //修改
      mutations: {
        'SET_FILENAME':(state,fileName)=>{
          state.fileName=fileName
        },
        'SET_MENUVISIBLE':(state,menuVisible)=>{
          state.menuVisible=menuVisible
        }
      },
      //方法
      actions: {
        setFileName:({commit},fileName)=>{
          return commit('SET_FILENAME',fileName)
        },
        setMenuVisible:({commit},menuVisible)=>{
          return commit('SET_MENUVISIBLE',menuVisible)
        }
      }
}
export default book;