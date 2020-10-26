fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"

client_scripts {
	'config.lua',
	'client.lua'
}
server_scripts {
	'config.lua',
	'server.lua'
}

export 'showAlert'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/main.js',
	'html/main.css',
	'html/images/job.png',
	'html/images/society.svg',
	'html/images/black_money.svg',
	'html/images/bank.svg',
	'html/images/money.svg',
}