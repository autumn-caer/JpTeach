// import headerTestTypes from '../mixIns/headerTestTypeList'
import Config from '../const/config'

export default function (id) {
    console.log('start', Config.headerTestTypes)
    let type = Config.headerTestTypes.find(element => element.id == id);
    return type != null ? type.value : ''; 
  }