def _filter(dot_file, output_file):
	with open(output_file, 'w') as out:
		for line in open(dot_file):
			if '.h"' not in line:
				out.write(line)


if __name__ == '__main__':
	import sys
	_filter(sys.argv[1], sys.argv[2])