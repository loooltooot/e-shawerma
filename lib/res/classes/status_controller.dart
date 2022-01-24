class StatusController {
  static String getStatus(int amount) {
    if(amount >= 10000) {
      return ' 📴 get gf'; // black
    } else if(amount >= 1000) {
      return ' 🖤'; // black
    } else if(amount >= 100) {
      return ' 💜'; // purple
    } else if(amount >= 10) {
      return ' 💚'; // green
    }
    return '';
  }
}