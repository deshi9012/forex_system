import VueRouter from 'vue-router'
window.Vue.use(VueRouter);

import IntroductionPageIndex from './components/IntroductionPage/IntroductionPageIndex.vue'
import IntroductionPageCreate from './components/IntroductionPage/IntroductionPageCreate.vue'
import IntroductionPageEdit from './components/IntroductionPage/IntroductionPageEdit.vue'
import IntroductionPageShow from './components/IntroductionPage/IntroductionPageShow.vue'

import FileManagement from './components/FileManagement/FileManagement.vue'


import UserIndex from './components/User/UserIndex.vue'
import UserShow from './components/User/UserShow.vue'
import UserEdit from './components/User/UserEdit.vue'
import UserCreate from './components/User/UserCreate.vue'

import PositionIndex from './components/Position/PositionIndex.vue'
import PositionCreate from './components/Position/PositionCreate.vue'
import PositionEdit from './components/Position/PositionEdit.vue'

import PageIndex from './components/Page/PageIndex.vue'
import PageShow from './components/Page/PageShow.vue'
import PageEdit from './components/Page/PageEdit.vue'
import PageCreate from './components/Page/PageCreate.vue'

import DocumentIndex from './components/Document/DocumentIndex.vue'
import DocumentShow from './components/Document/DocumentShow.vue'
import DocumentEdit from './components/Document/DocumentEdit.vue'
import DocumentCreate from './components/Document/DocumentCreate.vue'

import DocumentCategoryIndex from './components/DocumentCategory/DocumentCategoryIndex.vue'
import DocumentCategoryCreate from './components/DocumentCategory/DocumentCategoryCreate.vue'
import DocumentCategoryEdit from './components/DocumentCategory/DocumentCategoryEdit.vue'


import PageCategoryIndex from './components/PageCategory/PageCategoryIndex.vue'
import PageCategoryCreate from './components/PageCategory/PageCategoryCreate.vue'
import PageCategoryEdit from './components/PageCategory/PageCategoryEdit.vue'

import DocumentTagIndex from './components/DocumentTag/DocumentTagIndex.vue'
import DocumentTagCreate from './components/DocumentTag/DocumentTagCreate.vue'
import DocumentTagEdit from './components/DocumentTag/DocumentTagEdit.vue'

import PageTagIndex from './components/PageTag/PageTagIndex.vue'
import PageTagCreate from './components/PageTag/PageTagCreate.vue'
import PageTagEdit from './components/PageTag/PageTagEdit.vue'


import RoleIndex from './components/Role/RoleIndex.vue'
import RoleCreate from './components/Role/RoleCreate.vue'
import RoleEdit from './components/Role/RoleEdit.vue'

import PositionTree from './components/PositionTree/PositionTree.vue'


import FileManagementElFinder from './components/FileManagement/FileManagement_elfinder.vue'

import CreativeBank from './components/FileManagement/CreativeBank.vue'
import ContentBank from './components/FileManagement/ContentBank.vue'
import UserFiles from './components/FileManagement/UserFiles.vue'

import HistoryIndex from './components/History/HistoryIndex.vue'
import HistoryShow from './components/History/HistoryShow.vue'

const router = new VueRouter({
	routes: [

		//Introduction page
		{ path: '/', component: IntroductionPageIndex , name: 'introduction-page' },
		{ path: '/introduction-page/create', component: IntroductionPageCreate , name: 'introduction-page-create' },
		{ path: '/introduction-page/:id/edit', component: IntroductionPageEdit , name: 'introduction-page-edit' },
		//{ path: '/introduction-page/:id', component: IntroductionPageShow , name: 'introduction-page-show' },\


		//File Management page
		{ path: '/file', component: FileManagement , name: 'file-management' },
		{ path: '/file/*', component: FileManagement , name: 'file-management' },

		//File Management page
		{ path: '/file-manager/content', component: ContentBank , name: 'content-bank' },
		{ path: '/file-manager/creative', component: CreativeBank , name: 'creative-bank' },
		{ path: '/file-manager/users', component: UserFiles , name: 'creative-bank' },

		//User routes
		{ path: '/user', component: UserIndex , name: 'user-index' },
		{ path: '/user/create', component: UserCreate , name: 'user-create' },
		{ path: '/user/:id', component: UserShow , name: 'user-show' },
		{ path: '/user/:id/edit', component: UserEdit , name: 'user-edit' },

		//Position routes
		{ path: '/position', component: PositionIndex , name: 'position-index' },
		{ path: '/position/create', component: PositionCreate , name: 'position-create' },
		{ path: '/position/:id/edit', component: PositionEdit , name: 'position-edit' },

		//Role routes
		{ path: '/role', component: RoleIndex , name: 'role-index' },
		{ path: '/role/create', component: RoleCreate , name: 'role-create' },
		{ path: '/role/:id/edit', component: RoleEdit , name: 'role-edit' },

		//PageCategory routes
		{ path: '/category/page', component: PageCategoryIndex , name: 'page-category-index' },
		{ path: '/category/page/create', component:PageCategoryCreate  , name: 'page-category-create' },
		{ path: '/category/page/:id/edit', component: PageCategoryEdit , name: 'page-category-edit' },

		//PageTag routes
		{ path: '/tag/page', component: PageTagIndex , name: 'page-tag-index' },
		{ path: '/tag/page/create', component:PageTagCreate  , name: 'page-tag-create' },
		{ path: '/tag/page/:id/edit', component: PageTagEdit , name: 'page-tag-edit' },

		//Page routes
		{ path: '/page', component: PageIndex , name: 'page-index' },
		{ path: '/page/create', component: PageCreate , name: 'page-create' },
		{ path: '/page/:id', component: PageShow , name: 'page-show' },
		{ path: '/page/:id/edit', component: PageEdit , name: 'page-edit' },

		//Document routes
		{ path: '/document', component: DocumentIndex , name: 'document-index' },
		{ path: '/document/create', component: DocumentCreate , name: 'document-create' },
		{ path: '/document/:id', component: DocumentShow , name: 'document-show' },
		{ path: '/document/:id/edit', component: DocumentEdit , name: 'document-edit' },

		//DocumentCategory routes
		{ path: '/category/document', component: DocumentCategoryIndex , name: 'document-category-index' },
		{ path: '/category/document/create', component: DocumentCategoryCreate , name: 'document-category-create' },
		{ path: '/category/document/:id/edit', component: DocumentCategoryEdit , name: 'document-category-edit' },

		//Tag routes
		{ path: '/tag/document', component: DocumentTagIndex , name: 'document-tag-index' },
		{ path: '/tag/document/create', component:DocumentTagCreate  , name: 'document-tag-create' },
		{ path: '/tag/document/:id/edit', component: DocumentTagEdit , name: 'document-tag-edit' },

		{ path: '/tree',component: PositionTree, name: 'tree-chart' },
		{ path: '/tree/user/:id', component: UserShow , name: 'user-show' },

		{ path: '/history', component: HistoryIndex , name: 'history-index' },
		{ path: '/history/:id', component: HistoryShow , name: 'history-show' },

	]
});

module.exports = {
	router
};