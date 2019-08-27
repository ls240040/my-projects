const book={
    state: {
        fileName:""
      },
      mutations: {
        'SET_fileName':(state,fileName)=>{
          state.fileName=fileName
        }
      },
      actions: {
        setFileName:({commit},fileName)=>{
          return commit('SET_fileName',fileName)
        }
      }
}
export default book;