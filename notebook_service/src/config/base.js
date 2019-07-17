const config =  {
  dbs: 'mongodb://127.0.0.1:27017/notebook',
  redis: {
    get host() {
      return "127.0.0.1";
    },
    get port() {
      return 6379;
    }
  },

  smtp: {
    get appkey() {
      return "61c9204179403d15085b17384b441dd8";
    },
    get appid() {
      return "1400222344";
    },

    get host() {
      return "smtp.qq.com";
    },
    get user() {
      return "717503359@qq.com";
    },
    get pass() {
      return "ifisntifltawbcbi";
    },
    get code() {
      return () => {
        return Math.random()
          .toString(16)
          .slice(2, 6)
          .toUpperCase();
      };
    },
    get expire() {
      return () => {
        return new Date().getTime() * 60 * 60 * 1000;
      };
    }
  }
};

module.exports = config;
