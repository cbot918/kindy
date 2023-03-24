## 以下順序執行
image:
	docker build -t auth services/auth/. 

pod:
	kubectl apply -f pod.yaml
##這步驟第一次創建會比較久

service:
	kubectl apply -f service.yaml

forward:
	kubectl port-forward svc/auth-svc 3001:3001

curl:
	curl localhost:3001


## 以下紀錄用
kcur:
	kubectl run curl --image=curlimages/curl -it -- sh

kacur:
	kubectl attach curl -c curl -i -t

.PHONY: image pod service forword curl
.SILENT: image pod service forword curl