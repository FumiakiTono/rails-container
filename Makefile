PID = /path/to/unicorn.pid

all:
    @echo Usage: (start|stop|restart|graceful)
start:
    @bundle exec unicorn_rails -c config/unicorn.rb -D
stop:
    @[[ -s "$(PID)" ]] && kill -QUIT `cat $(PID)`
restart:
    @[[ -s "$(PID)" ]] && kill -HUP `cat $(PID)`
graceful:
    @[[ -s "$(PID)" ]] && kill -USR2 `cat $(PID)`
