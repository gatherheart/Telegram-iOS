import re

def _filter(dot_file, output_file, min_loc=4000):
	cloc_stats = {}
	for l in open('submodule_cloc.csv'):
		tokens = l.split(',')
		if len(tokens) < 6:
			continue
		cloc_stats[tokens[0]] = int(tokens[2])

	print('loaded %d stats' % len(cloc_stats))

	with open(output_file, 'w') as out:
		for line in open(dot_file):
			if '.h"' in line:
				continue
			reserve = True
			if '->' in line or 'style=' in line:
				for g in re.findall(r'//submodules/([A-Za-z/]*)', line):
					if cloc_stats.get(g, 0) < min_loc:
						reserve = False
						break
			if reserve:
				out.write(line)

if __name__ == '__main__':
	import sys
	_filter(sys.argv[1], sys.argv[2])