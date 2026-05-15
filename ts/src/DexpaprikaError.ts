
import { Context } from './Context'


class DexpaprikaError extends Error {

  isDexpaprikaError = true

  sdk = 'Dexpaprika'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  DexpaprikaError
}

