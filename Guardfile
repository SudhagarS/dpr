guard :rspec, cmd: "bundle exec rspec" do
  watch(%r{lib/dpr/(.+).rb})  { |m| "spec/lib/pry-state/#{m[1]}_spec.rb" }
  watch(%r{spec/lib/dpr/(.+)_spec.rb})  { |m| "spec/lib/dpr/#{m[1]}_spec.rb" }
end
