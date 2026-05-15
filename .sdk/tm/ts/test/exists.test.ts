
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { DexpaprikaSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await DexpaprikaSDK.test()
    equal(null !== testsdk, true)
  })

})
