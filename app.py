from flask import Flask
# Necesario para ejecutar comandos a nivel sistema operativo
import subprocess

app = Flask(__name__)

@app.route('/')
def showlldpd():
	command = "./out.sh"
	#command = "nproc"
	result = subprocess.check_output(command, shell=True)
	result_str = result.decode('utf-8').strip()
	return result_str

# Only for debugging purposes
@app.route('/date')
def showdate():
	command = "date"
	result = subprocess.check_output(command, shell=True)
	result_str = result.decode('utf-8').strip()
	return result_str

if __name__ == '__main__':
	app.run()
