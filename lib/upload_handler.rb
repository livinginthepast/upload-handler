require 'rb-readline'
require 'pry'
require 'fileutils'
require 'sinatra'

class UploadHandler < Sinatra::Base
  put '/*.*' do
    filename = '/tmp/upload-handler/' + params['splat'].join('.')
    dirname = File.dirname(filename)
    FileUtils.mkdir_p(dirname)
    File.open(filename, 'w') do |f|
      f.write(request.body.read)
    end
    return '{}'
  end
end
