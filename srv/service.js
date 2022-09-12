module.exports = function () {
  this.before("*", async (req) => {
    console.log(
      "host: ",
      req.headers.host,
      "baseUrl: ",
      req.req.baseUrl,
      "Url: ",
      req.req.url,
      "user.locale: ",
      req.user.locale,
      "user._roles: ",
      req.user._roles,
      "user.attr: ",
      req.user.attr,
      " event: ",
      req.event,
      " entity: ",
      req.entity
    );
    console.log(" originalUrl: ", req.req.originalUrl, "user.id: ", req.user.id);
    // console.log(req.query);
  });
};
