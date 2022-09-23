module.exports = function () {
  this.before("READ", "*", async (req) => {
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
    console.log(
      " originalUrl: ",
      req.req.originalUrl,
      "user.id: ",
      req.user.id
    );
    // console.log(req.query);
  });

  this.on("READ", "User", async (req) => {
    return req.user;
  });

  this.before("SAVE", "Fakes", async (req) => {
    if (req.data.test.length < 10) {
      req.reject(400, "TEST_CONTENT_TO_SHORT");
    }
  });

  this.on("createFake", async (req) => {
    console.log("createFake");
    const systemService = await cds.connect("SystemService");
    const { Fakes } = systemService.entities;
    const createResult = await systemService
      .create(Fakes)
      .entries({ test: "Test" });
  });
  this.on("assignDraftToCurrentUser", async (req) => {
    console.log("assignDraftToCurrentUser");
  });
};
