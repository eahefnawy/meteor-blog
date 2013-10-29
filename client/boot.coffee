Meteor.startup ->
  $('<link>',
    href: '//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'
    rel: 'stylesheet'
  ).appendTo 'head'

  js = undefined
  fjs = document.getElementsByTagName('script')[0]
  unless document.getElementById('twitter-wjs')
    js = document.createElement('script')
    js.id = 'twitter-wjs'
    js.src = "https://platform.twitter.com/widgets.js"
    fjs.parentNode.insertBefore js, fjs

  js = undefined
  id = "facebook-jssdk"
  ref = document.getElementsByTagName("script")[0]
  return  if document.getElementById(id)
  js = document.createElement("script")
  js.id = id
  js.async = true
  js.src = "//connect.facebook.net/en_US/all.js"
  ref.parentNode.insertBefore js, ref

#
# Register global helpers
#

# Use the pattern {{active '/path'}} inside of the class="" to have an active
# class added end add active class to navigation
Handlebars.registerHelper "active", (path) ->
  curPath = ->
    # Get the current path for URL 
    c = window.location.pathname
    b = c.slice(0, -1)
    a = c.slice(-1)
    if b is ""
      "/"
    else
      if a is "/"
        b
      else
        c

  (if curPath() is path then "active" else "")

Handlebars.registerHelper "formatDate", (date) ->
  moment(new Date(date)).format "MMM Do, YYYY"