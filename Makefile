# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
GIT_BRANCH    :=$(shell git rev-parse --abbrev-ref HEAD)
BUILDDIR      = build/${GIT_BRANCH}
SPHINXOPTS    = -d $(BUILDDIR)/doctrees -W -c .
SOURCECOPYDIR = $(BUILDDIR)/source/
APPS_PATH     = $(SOURCECOPYDIR)appcode

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCECOPYDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help clean Makefile migrate html linkcheck dirhtml apps

clean:
	if [ -d $(BUILDDIR) ]; then rm -rf $(BUILDDIR) ; fi;

linkcheck: Makefile migrate
	@$(SPHINXBUILD) -M $@ "$(SOURCECOPYDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

migrate: clean
	mkdir -p $(SOURCECOPYDIR)

   # Copying to SOURCECOPYDIR instead of copying source dir to BUILDDIR
   # in case someone forgets to backslash after build/

	cp -R $(SOURCEDIR)/* $(SOURCECOPYDIR)

html: Makefile migrate apps

	@$(SPHINXBUILD) -M $@ "$(SOURCECOPYDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O) 

dirhtml: Makefile  migrate  apps

	@$(SPHINXBUILD) -M $@ "$(SOURCECOPYDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile migrate
	@$(SPHINXBUILD) -M $@ "$(SOURCECOPYDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

apps: 
	curl -SfL https://raw.githubusercontent.com/inrupt/solid-ui-react-example-project/master/pages/_app.tsx  -o ${APPS_PATH}/app.tsx
	curl -SfL https://raw.githubusercontent.com/inrupt/solid-ui-react-example-project/master/components/loginForm/index.tsx -o ${APPS_PATH}/loginForm.tsx
	curl -SfL https://raw.githubusercontent.com/inrupt/solid-ui-react-example-project/master/pages/index.tsx -o ${APPS_PATH}/pages.tsx
	curl -SfL https://raw.githubusercontent.com/inrupt/solid-ui-react-example-project/master/components/profile/index.tsx -o ${APPS_PATH}/profile.tsx
  
