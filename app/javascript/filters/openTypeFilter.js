import Config from '../const/config'

export default function (id) {
    let type = Config.openTypes.find(element => element.id == id);
    return type != null ? type.value : ''; 
  }