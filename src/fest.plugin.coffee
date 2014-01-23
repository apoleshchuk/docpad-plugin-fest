module.exports = (BasePlugin) ->
	util = require('util')
	fest = require('fest')

	class FestPlugin extends BasePlugin
		name: 'fest'
		config:
			templateWrapper: "<?xml version=\"1.0\"?><fest:template xmlns:fest=\"http://fest.mail.ru\" context_name=\"data\">%s</fest:template>"

		render: (opts) ->
			config = @getConfig()
			{inExtension,templateData} = opts

			if inExtension is 'fest'
				try
					opts.content = fest.render(opts.file.name, templateData, {template: util.format(config.templateWrapper, opts.content or '')})
				catch err
					return err

			return true