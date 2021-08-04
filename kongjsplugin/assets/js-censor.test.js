const plugin = require('./js-censor');

const {
  PluginTest,
  Request
} = require("kong-pdk/plugin_test")


test('Set headers in response', async () => {
  let r = new Request()

  r
    .useURL("http://example.com")
    .useMethod("GET")
    .useHeaders({
      "Host": "example.com",
    })
    .useBody("Ur so sexy babe!")

  let t = new PluginTest(r)

  await t.Run(plugin, {})

  expect(t.serviceRequest.body)
    .toBe('Ur so ***y babe!')

  expect(t.response.status)
    .toBe(200)

  expect(t.serviceResponse.body)
    .toBe("OK")

  expect(t.response.body)
    .toBe(
      `Response body from upstream:
OK
Body size: 2
`)

})
