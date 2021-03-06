fit = require '../'
{readFileSync} = require 'fs'
{join} = require 'path'
should = require 'should'
require 'mocha'

# because expected result file is in MST timezone
process.env.TZ = 'America/Phoenix'

exampleFitFile = readFileSync join __dirname, "./fixtures/example.fit"
expected = require './fixtures/expected'

# shiz

describe 'fit', ->
  describe 'parse(buffer, cb)', ->
    it 'should work', (done) ->
      fit.parse exampleFitFile, (err, res) ->
        should.not.exist err
        res.should.eql expected
        done()
