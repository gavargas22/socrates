# Define the name of the application
set :application, 'socrates'

# Define where can Capistrano access the source repository
# set :repo_url, 'https://github.com/[user name]/[application name].git'
set :scm, :git
set :repo_url, 'git@git.at.utep.edu:gavargas/socrates.git'


# Define where to put your application code
set :deploy_to, "/var/sentora/hostdata/zadmin/public_html/socrates_utep_edu"

set :pty, true

set :format, :pretty

# Set the post-deployment instructions here.
# Once the deployment is complete, Capistrano
# will begin performing them as described.
# To learn more about creating tasks,
# check out:
# http://capistranorb.com/

namespace :deploy do

	desc 'Restart application'
	task :restart do
		on roles(:app), in: :sequence, wait: 5 do
			# Your restart mechanism here, for example:
			execute :touch, release_path.join('tmp/restart.txt')
		end
	end

	task :fix_absent_manifest_bug do
		on roles(:web) do
			within release_path do  execute :touch,
				release_path.join('public', fetch(:assets_prefix), 'manifest-fix.temp')
			end
	 end
	end

	after :publishing, :restart

	after :restart, :clear_cache do
		on roles(:web), in: :groups, limit: 3, wait: 10 do
			# Here we can do anything such as:
			# within release_path do
			#   execute :rake, 'cache:clear'
			# end
		end
	end

	task :fix_absent_manifest_bug do
			on roles(:web) do
				within release_path do  execute :touch,
					release_path.join('public', fetch(:assets_prefix), 'manifest-fix.temp')
				end
		 end
		end

		after :updating, 'deploy:fix_absent_manifest_bug'

	# Fixing broken links that are affecting the course avatars.
	# task :symlink_config, roles: :app do
	# 	run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
	# end

end
