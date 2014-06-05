# Based off https://gist.github.com/jpayne/3677675
namespace :resque do
  desc "Restart resque workers. NOTE: Requires upstart configs to be active"
  task :restart_workers => :environment do
    pids = Array.new
    Resque.workers.each do |worker|
      pids << worker.to_s.split(/:/).second
    end
    if pids.size > 0
      system("kill -QUIT #{pids.join(' ')}")
    end
  end
end