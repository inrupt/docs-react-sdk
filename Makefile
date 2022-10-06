# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
GIT_BRANCH    :=$(shell git rev-parse --abbrev-ref HEAD)
BUILDDIR      = build/${GIT_BRANCH}
SPHINXOPTS    = -d $(BUILDDIR)/doctrees  -c .
SOURCECOPYDIR = $(BUILDDIR)/source/
APPS_PATH     = $(SOURCECOPYDIR)appcode
DOCS_ASSETS   = build/docs-assets

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCECOPYDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help clean Makefile migrate html linkcheck dirhtml apps tempFix

clean:
	if [ -d $(BUILDDIR) ]; then rm -rf $(BUILDDIR) ; fi;
	if [ -d $(DOCS_ASSETS) ]; then rm -rf $(DOCS_ASSETS) ; fi;

linkcheck: Makefile migrate
	@$(SPHINXBUILD) -M $@ "$(SOURCECOPYDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

migrate: clean
	mkdir -p $(SOURCECOPYDIR)
	mkdir -p $(APPS_PATH)

	git clone https://github.com/inrupt/docs-assets.git $(DOCS_ASSETS)

   # Copying to SOURCECOPYDIR instead of copying source dir to BUILDDIR
   # in case someone forgets to backslash after build/

	cp -R $(SOURCEDIR)/* $(SOURCECOPYDIR)

html: Makefile migrate apps tempFix

	@$(SPHINXBUILD) -M $@ "$(SOURCECOPYDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O) 

dirhtml: Makefile  migrate  apps tempFix

	@$(SPHINXBUILD) -M $@ "$(SOURCECOPYDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile migrate apps
	@$(SPHINXBUILD) -M $@ "$(SOURCECOPYDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

tempFix: apps
	
ifdef IS_MAC
	sed -i '' -e 's/broker\.pod\./login\./g' ${APPS_PATH}/loginForm.jsx;
	
else
	sed -i  -e 's/broker\.pod\./login\./g' ${APPS_PATH}/loginForm.jsx;
endif

apps: 
	curl -SfL https://raw.githubusercontent.com/inrupt/solid-ui-react-demo/main/components/appContainer/index.jsx -o ${APPS_PATH}/appContainer.jsx
	curl -SfL https://raw.githubusercontent.com/inrupt/solid-ui-react-demo/main/pages/index.jsx -o ${APPS_PATH}/pages.jsx
	curl -SfL https://raw.githubusercontent.com/inrupt/solid-ui-react-demo/main/components/loginForm/index.jsx -o ${APPS_PATH}/loginForm.jsx
	curl -SfL https://raw.githubusercontent.com/inrupt/solid-ui-react-demo/main/components/profile/index.jsx -o ${APPS_PATH}/profile.jsx

  
