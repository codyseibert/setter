nodemailer = require('nodemailer')

Mailer = ->
  'use strict'
  transport = undefined
  fromEmail = undefined
  transport = nodemailer.createTransport()
  fromEmail = 'accounts@setter.rocks'

  @mailResetPassword = (pEmail, pPassword) ->
    transport.sendMail
      from: fromEmail
      to: pEmail
      subject: 'Password reset at setter.rocks'
      text: 'You have requested your password to be reset.  Your new password is ' + pPassword
      html: 'You have requested your password to be reset.  Your new password is <b>' + pPassword + '</b>.  You can now log in using that password at <a href="http://setter.rocks/#/login">http://setter.rocks/#/login</a>'
    return

  return

module.exports = new Mailer
