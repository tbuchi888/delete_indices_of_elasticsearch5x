#! /usr/bin/ruby
require "open3"

# Check ARGV0
if ARGV[0].nil?
 puts "ERROR: Set ARGV[0] indexname"
 exit -1
end

# Check ARGV1
if ARGV[1].nil?
 puts "ERROR: Set ARGV[1] old_cnt_days"
 exit -1
end

# define vars
indexname    = ARGV[0]
old_cnt_days = ARGV[1]

command="curator_cli --host 127.0.0.1 delete_indices --filter_list '[{\"filtertype\":\"age\",\"source\":\"creation_date\",\"direction\":\"older\",\"unit\":\"days\",\"unit_count\":#{old_cnt_days}},{\"filtertype\":\"pattern\",\"kind\":\"prefix\",\"value\":\"#{indexname}\"}]'"

out, err, status = Open3.capture3(command)

if status.exitstatus == 0 
  p out
  exit 0;
elsif (status.exitstatus == 1) && (out.include?("Singleton action failed due to empty index list")) 
  p out
  p err
  exit 0;
els
  p out
  p err
  exit -1;
end
