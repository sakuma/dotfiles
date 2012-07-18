# -*- mode:ruby -*-

# manual - http://www.ruby-lang.org/ja/man/html/irb.html

require 'rubygems'
require 'active_support'
require 'pp'
require 'irb/completion' # メソッド補完
# require 'what_methods' # what? でメソッドを調べる
require 'wirble' # カラーリングの設定

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:BACK_TRACE_LIMIT]=16
IRB.conf[:DEBUG_LEVEL]=1
IRB.conf[:ECHO] = nil
IRB.conf[:EVAL_HISTORY] = nil
IRB.conf[:HISTORY_FILE] = "~/.irb.d/irb_history" #((<ruby 1.9 feature>))
IRB.conf[:IGNORE_EOF] = false
IRB.conf[:IGNORE_EOF]=false
# IRB.conf[:IGNORE_SIGINT] = true
IRB.conf[:INSPECT_MODE]=nil
IRB.conf[:IRB_NAME]="#{RUBY_VERSION}"
# IRB.conf[:IRB_RC] = nil
IRB.conf[:MATH_MODE]=false
# IRB.conf[:PROMPT] = {...}
# IRB.conf[:PROMPT_MODE] = :DEFALUT
# IRB.conf[:SINGLE_IRB] = false
IRB.conf[:SAVE_HISTORY] = 1000000  #((<ruby 1.9 feature>))
# IRB.conf[:USE_LOADER] = false
# IRB.conf[:USE_LOADER]=false
# IRB.conf[:USE_READLINE] = nil
# IRB.conf[:USE_TRACER] = false
# IRB.conf[:USE_TRACER]=false
# IRB.conf[:VERBOSE]=true

Wirble.init
Wirble.colorize

def ls (path = "./", opt = nil)
  begin
    option = opt ? "-CF" + opt.to_s : "-CF"
    ls_path = path
    print `ls #{option} #{ls_path}`
  rescue
    puts "引数が間違っています"
  end
end
