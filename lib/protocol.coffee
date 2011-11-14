# Shared functions specified by [UPnP Device Protocol] [1], for
# both Devices and Services.
#
# [1]: http://upnp.org/index.php/sdcps-and-certification/standards/sdcps/

# Make namespace string.
exports.makeNameSpace = (prefix = 'urn:schemas-upnp-org', version = '1.0') ->
    [ prefix
      'device'
      version.split('.')[0]
      version.split('.')[1]
    ].join '-'

# Make Device/Service type string for SSDP messages
# and Service/Device descriptions.
makeType = (category, type, version, schemaPrefix = 'urn:schemas-upnp-org') ->
    [ schemaPrefix
      category
      @type || type
      @version || version
    ].join ':'

exports.makeDeviceType = -> makeType.call @, 'device'

exports.makeServiceType = (serviceType, version) ->
    makeType 'service', serviceType, version